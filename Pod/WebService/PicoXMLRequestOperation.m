//
//  PicoXMLRequestOperation.m
//  Pico
//
//  Created by bulldog on 13-3-18.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoXMLRequestOperation.h"
#import "PicoXMLReader.h"

static dispatch_queue_t ls_xml_request_operation_processing_queue;
static dispatch_queue_t xml_request_operation_processing_queue() {
    if (ls_xml_request_operation_processing_queue == NULL) {
        ls_xml_request_operation_processing_queue = dispatch_queue_create("com.leansoft.pico.networking.xml-request.processing", 0);
    }
    
    return ls_xml_request_operation_processing_queue;
}

@interface PicoXMLRequestOperation ()
@property (readwrite, nonatomic, strong) NSError *PicoError;
@property (readwrite, nonatomic, strong) id responseObj;
@end

@implementation PicoXMLRequestOperation

@synthesize responseObj = _responseObj;
@synthesize PicoError  = _PicoError;
@synthesize responseClazz = _responseClazz;
@synthesize debug = _debug;
@synthesize config = _config;

-(id)responseObj {
    if (!_responseObj && [self isFinished] && [self.responseData length] > 0 && !self.PicoError) {
        
        if (self.debug) {
            NSLog(@"Response message : ");
            NSString *message = [[NSString alloc] initWithData:self.responseData encoding:CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((CFStringRef)self.config.encoding))];
            NSLog(@"%@", message);
        }
        
        PicoXMLReader *xmlReader = nil;
        @try {
            // unmarshall to object
            xmlReader = [[PicoXMLReader alloc] initWithConfig:self.config];
            self.responseObj = [xmlReader fromData:self.responseData withClass:self.responseClazz];
        } @catch (NSException *ex) {
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:@"Error to read xml response" forKey:NSLocalizedDescriptionKey];
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
    return [NSSet setWithObjects:@"text/xml", nil];
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
                    NSLog(@"Response HTTP headers : \n%@", [weakSelf.response allHeaderFields]);
                }
            }
            
            dispatch_async(xml_request_operation_processing_queue(), ^{
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
