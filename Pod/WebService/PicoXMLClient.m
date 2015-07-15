//
//  PicoXMLClient.m
//  Pico
//
//  Created by bulldog on 13-3-18.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLClient.h"
#import "PicoXMLWriter.h"

enum {
    PicoXMLParameterEncoding = 11
};

@interface PicoXMLClient ()

@property (readwrite, nonatomic, strong) NSURL *endpointURL;

@end

@implementation PicoXMLClient

@synthesize endpointURL = _endpointURL;
@synthesize debug = _debug;
@synthesize config = _config;
@synthesize additionalParameters = _additionalParameters;

- (instancetype)initWithEndpointURL:(NSURL *)URL {
    NSParameterAssert(URL);
    
    self = [super initWithBaseURL:URL];
    if (!self) {
        return nil;
    }
    
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

- (PicoXMLRequestOperation *)PicoXMLRequestOperationWithRequest:(NSURLRequest *)request
                                                          success:(void (^)(PicoXMLRequestOperation *operation, id responseObject))success
                                                          failure:(void (^)(PicoXMLRequestOperation *operation, NSError *error))failure {
    
    PicoXMLRequestOperation *operation = [[PicoXMLRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = self.responseSerializer;
    operation.shouldUseCredentialStorage = self.shouldUseCredentialStorage;
    operation.credential = self.credential;
    operation.securityPolicy = self.securityPolicy;
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        success((PicoXMLRequestOperation*)operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure((PicoXMLRequestOperation*)operation, error);
    }];
    
    operation.completionQueue = self.completionQueue;
    operation.completionGroup = self.completionGroup;
    
    operation.debug = self.debug;
    operation.config = self.config;
    
    return operation;
}

- (void)invoke:(id<PicoBindable>)requestObject responseClass:(Class)responseClazz
       success:(void (^)(PicoXMLRequestOperation *operation, id<PicoBindable> responseObject))success
       failure:(void (^)(PicoXMLRequestOperation *operation, NSError *error))failure {
    
    NSParameterAssert(self.config);
    
    @try {
        NSMutableURLRequest *request = [self requestWithMethod:@"POST" requestObject:requestObject];
        request.timeoutInterval = self.timeoutInverval;
        
        PicoXMLRequestOperation *picoOperation = [self PicoXMLRequestOperationWithRequest:request success:^(PicoXMLRequestOperation *operation, id responseObject) {
            
            if (operation.responseObj) {
                if (success) {
                    success(operation, operation.responseObj);
                }
            } else {
                if (failure) {
                    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:@"Empty response" forKey:NSLocalizedDescriptionKey];
                    NSError *error = [NSError errorWithDomain:PicoErrorDomain code:ReaderError userInfo:userInfo];
                    failure(operation, error);
                }
            }
        } failure:^(PicoXMLRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(operation, operation.error);
            }
        } ];
        
        picoOperation.responseClazz = responseClazz;
        picoOperation.debug = self.debug;
        picoOperation.config = self.config;
        
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
            failure(nil, error);
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
    
    PicoXMLWriter *xmlWriter = [[PicoXMLWriter alloc] initWithConfig:self.config];
    // marshall to xml message
    NSData *xmlData = [xmlWriter toData:requestObject];
    
    NSAssert(xmlData != nil, @"Expect success soap marshalling");
    
    if (self.debug) {
        NSLog(@"Request message:");
        NSString *message = [[NSString alloc] initWithData:xmlData encoding:CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding))];
        NSLog(@"%@", message);
    }
    
    request.HTTPBody = xmlData;
    
    return request;
}


@end
