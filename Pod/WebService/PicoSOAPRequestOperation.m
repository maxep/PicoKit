//
//  PicoRequestOperation.m
//  Pico
//
//  Created by bulldog on 13-3-15.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoSOAPRequestOperation.h"
#import "PicoSOAPReader.h"
#import "SOAP11Envelope.h"
#import "SOAP12Envelope.h"
#import "SOAP11Body.h"
#import "SOAP12Body.h"

static dispatch_queue_t ls_soap_request_operation_processing_queue;
static dispatch_queue_t soap_request_operation_processing_queue() {
    if (ls_soap_request_operation_processing_queue == NULL) {
        ls_soap_request_operation_processing_queue = dispatch_queue_create("com.leansoft.pico.networking.soap-request.processing", 0);
    }
    
    return ls_soap_request_operation_processing_queue;
}

@interface PicoSOAPRequestOperation ()
@property (readwrite, nonatomic, strong) NSError *PicoError;
@property (readwrite, nonatomic, strong) id responseObj;
@end

@implementation PicoSOAPRequestOperation

@synthesize responseObj = _responseObj;
@synthesize PicoError  = _PicoError;
@synthesize responseClazz = _responseClazz;
@synthesize soapVersion = _soapVersion;
@synthesize debug = _debug;
@synthesize config = _config;

-(id)responseObj {
    if (!_responseObj && [self isFinished] && [self.responseData length] > 0 && !self.PicoError) {
        
        if (self.debug) {
            NSLog(@"Response message : ");
            NSString *message = [[NSString alloc] initWithData:self.responseData encoding:CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding))];
            NSLog(@"%@", message);
        }
        
        PicoSOAPReader *soapReader = nil;
        @try {
            // unmarshall to object
            soapReader = [[PicoSOAPReader alloc] initWithConfig:self.config];
            if (self.soapVersion == SOAP11) {
                SOAP11Envelope *soap11Envelope = [soapReader fromData:self.responseData withSOAPClass:[SOAP11Envelope class] innerClass:self.responseClazz];
                if (soap11Envelope && soap11Envelope.body && soap11Envelope.body.any.count > 0) {
                    self.responseObj = (soap11Envelope.body.any)[0];
                }
            } else {
                SOAP12Envelope *soap12Envelope = [soapReader fromData:self.responseData withSOAPClass:[SOAP12Envelope class] innerClass:self.responseClazz];
                if (soap12Envelope && soap12Envelope.body && soap12Envelope.body.any.count > 0) {
                    self.responseObj = (soap12Envelope.body.any)[0];
                }
            }
        } @catch (NSException *ex) {
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:@"Error to read soap response" forKey:NSLocalizedDescriptionKey];
            [userInfo setValue:ex.reason forKey:NSLocalizedFailureReasonErrorKey];
            [userInfo setValue:ex forKey:NSUnderlyingErrorKey];
            self.PicoError = [NSError errorWithDomain:PicoErrorDomain code:ReaderError userInfo:userInfo];
            
            if (self.debug) {
                NSLog(@"Error to read response message : \n%@", [self.PicoError localizedDescription]);
            }
            
        }
    }
    
    return _responseObj;
}

- (NSError *)error {
    if (_PicoError) {
        return _PicoError;
    } else {
        return [super error];
    }
}

#pragma mark - AFHTTPRequestOperation

+ (NSSet *)acceptableContentTypes {
    return [NSSet setWithObjects:@"application/soap+xml", @"text/xml", nil];
}

- (void)setCompletionBlockWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    __weak typeof(self) weakSelf = self;
    
    self.completionBlock = ^ {
        if ([weakSelf isCancelled]) {
            return;
        }
        
        if (weakSelf.error) {
            if (weakSelf.debug) {
                NSLog(@"Response HTTP Error:\n%@", [weakSelf.error localizedDescription]);
            }
            if (failure) {
                dispatch_async(weakSelf.completionQueue ? weakSelf.completionQueue : dispatch_get_main_queue(), ^{
                    failure(weakSelf, weakSelf.error);
                });
            }
        } else {
            if (weakSelf.debug) {
                if (weakSelf.response) {
                    NSLog(@"Response HTTP status : \n%ld", (long)[weakSelf.response statusCode]);
                    NSLog(@"Response HTTP headers : \n%@", [weakSelf.response allHeaderFields]);
                }
            }
            
            dispatch_async(soap_request_operation_processing_queue(), ^{
                id obj = weakSelf.responseObj;
                
                if (weakSelf.PicoError) {
                    if (failure) {
                        dispatch_async(weakSelf.completionQueue ? weakSelf.completionQueue : dispatch_get_main_queue(), ^{
                            failure(weakSelf, weakSelf.error);
                        });
                    }
                } else {
                    if (success) {
                        dispatch_async(weakSelf.completionQueue ? weakSelf.completionQueue : dispatch_get_main_queue(), ^{
                            success(weakSelf, obj);
                        });
                    }
                }
            });
        }
        
    };
}

@end
