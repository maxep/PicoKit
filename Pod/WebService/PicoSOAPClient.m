//
//  PicoSOAPClient.m
//  Pico
//
//  Created by bulldog on 13-3-15.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoSOAPClient.h"
#import "SOAP11Fault.h"
#import "SOAP12Fault.h"
#import "PicoSOAPWriter.h"
#import "SOAP11Envelope.h"
#import "SOAP11Body.h"
#import "SOAP12Envelope.h"
#import "SOAP12Body.h"
#import "SOAP11Header.h"
#import "SOAP12Header.h"

enum {
    PicoSOAPParameterEncoding = 10
};

@interface PicoSOAPClient ()

@property (readwrite, nonatomic, strong) NSURL *endpointURL;

@end

@implementation PicoSOAPClient

@synthesize endpointURL = _endpointURL;
@synthesize soapVersion = _soapVersion;
@synthesize debug = _debug;
@synthesize config = _config;
@synthesize customSoapHeaders = _customSoapHeaders;
@synthesize additionalParameters = _additionalParameters;

- (instancetype)initWithEndpointURL:(NSURL *)URL {
    NSParameterAssert(URL);
    
    self = [super initWithBaseURL:URL];
    if (!self) {
        return nil;
    }
    
    self.soapVersion = SOAP11; // defaut to soap 11
    
    _config = [[PicoConfig alloc] init]; // default config
    
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self setDefaultHeader:@"Accept" value:@"text/xml"];
    [self setDefaultHeader:@"Content-Type" value:@"text/xml"];
    
    self.endpointURL = URL;
    
    self.timeoutInverval = 60;
    
    return self;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    return [self initWithEndpointURL:url];
}

- (void) setDefaultHeader:(NSString*)header value:(NSString*)value {
    [self.requestSerializer setValue:value forHTTPHeaderField:header];
}

- (PicoSOAPRequestOperation *)PicoSOAPRequestOperationWithRequest:(NSURLRequest *)request
                                                      success:(void (^)(PicoSOAPRequestOperation *operation, id responseObject))success
                                                      failure:(void (^)(PicoSOAPRequestOperation *operation, NSError *error))failure {
    PicoSOAPRequestOperation *operation = [[PicoSOAPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = self.responseSerializer;
    operation.shouldUseCredentialStorage = self.shouldUseCredentialStorage;
    operation.credential = self.credential;
    operation.securityPolicy = self.securityPolicy;
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        success((PicoSOAPRequestOperation*)operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure((PicoSOAPRequestOperation*)operation, error);
    }];
    
    operation.completionQueue = self.completionQueue;
    operation.completionGroup = self.completionGroup;
    
    operation.soapVersion = self.soapVersion;
    operation.debug = self.debug;
    operation.config = self.config;
    
    return operation;
}

- (void)invoke:(id<PicoBindable>)requestObject responseClass:(Class)responseClazz
       success:(void (^)(PicoSOAPRequestOperation *operation, id<PicoBindable> responseObject))success
       failure:(void (^)(PicoSOAPRequestOperation *operation, NSError *error, id<PicoBindable> soapFault))failure {
    
    NSParameterAssert(self.config);

    @try {
        NSMutableURLRequest *request = [self requestWithMethod:@"POST" requestObject:requestObject];
        request.timeoutInterval = self.timeoutInverval;

        PicoSOAPRequestOperation *picoOperation = [self PicoSOAPRequestOperationWithRequest:request success:^(PicoSOAPRequestOperation *operation, id responseObject) {
            
            if (responseObject) {
                if ([responseObject isMemberOfClass:[SOAP11Fault class]] || [responseObject isMemberOfClass:[SOAP12Fault class]]) {
                    if (failure) {
                        failure(operation, nil, responseObject); // soap fault
                    }
                } else {
                    if (success) {
                        success(operation, responseObject);
                    }
                }
            } else {
                if (failure) {
                    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:@"Empty response" forKey:NSLocalizedDescriptionKey];
                    NSError *error = [NSError errorWithDomain:PicoErrorDomain code:ReaderError userInfo:userInfo];
                    failure(operation, error, nil);
                }
            }
        } failure:^(PicoSOAPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(operation, error, nil);
            }
        }];
        
        picoOperation.responseClazz = responseClazz;

        if (self.debug) {
            NSLog(@"Request HTTP Headers : \n%@", [request allHTTPHeaderFields]);
        }

        [self.operationQueue addOperation:picoOperation];
        
    } @catch (NSException* ex) {
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:@"Error to build request" forKey:NSLocalizedDescriptionKey];
        [userInfo setValue:ex.reason forKey:NSLocalizedFailureReasonErrorKey];
        [userInfo setValue:ex forKey:NSUnderlyingErrorKey];
        NSError *error = [NSError errorWithDomain:PicoErrorDomain code:WriterError userInfo:userInfo];
        if (self.debug) {
            NSLog(@"Error to build request : \n%@", [error localizedDescription]);
        }
        if (failure) {
            failure(nil, error, nil);
        }
        return;
    }
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method requestObject:(id<PicoBindable>)requestObject {
    NSAssert(requestObject != nil, @"Expect non-nil request object");
    NSAssert([[requestObject class] conformsToProtocol:@protocol(PicoBindable)], @"Expect request object conforms to PicoBindable protocol");
    
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method
                                                                   URLString:self.endpointURL.absoluteString
                                                                  parameters:self.additionalParameters
                                                                       error:nil];
    if (self.debug) {
        NSLog(@"Sending request to : %@", request.URL.absoluteString);
    }
    
    PicoSOAPWriter *soapWriter = [[PicoSOAPWriter alloc] initWithConfig:self.config];
    
    // marshall to soap message
    NSData *soapData = nil;
    if (self.soapVersion == SOAP11) {
        SOAP11Envelope *soap11Envelope = [[SOAP11Envelope alloc] init];
        SOAP11Body *soap11Body = [[SOAP11Body alloc] init];
        soap11Envelope.body = soap11Body;
        soap11Envelope.body.any = [NSMutableArray arrayWithObject:requestObject];
        if (self.customSoapHeaders.count > 0) {
            SOAP11Header *soap11Header = [[SOAP11Header alloc] init];
            soap11Header.any = self.customSoapHeaders;
            soap11Envelope.header = soap11Header;
        }
        soapData = [soapWriter toData:soap11Envelope];
    } else {
        SOAP12Envelope *soap12Envelope = [[SOAP12Envelope alloc] init];
        SOAP12Body *soap12Body = [[SOAP12Body alloc] init];
        soap12Envelope.body = soap12Body;
        soap12Envelope.body.any = [NSMutableArray arrayWithObject:requestObject];
        if (self.customSoapHeaders.count > 0) {
            SOAP12Header *soap12Header = [[SOAP12Header alloc] init];
            soap12Header.any = self.customSoapHeaders;
            soap12Envelope.header = soap12Header;
        }
        soapData = [soapWriter toData:soap12Envelope];
    }
    
    NSAssert(soapData != nil, @"Expect success soap marshalling");
    
    if (self.debug) {
        NSLog(@"Request message:");
        NSString *message = [[NSString alloc] initWithData:soapData encoding:CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding))];
        NSLog(@"%@", message);
    }
    
    request.HTTPBody = soapData;
    
    return request;
}

@end
