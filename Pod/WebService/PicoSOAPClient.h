//
//  PicoSOAPClient.h
//  Pico
//
//  Created by bulldog on 13-3-15.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "PicoBindable.h"
#import "PicoSOAPRequestOperation.h"
#import "PicoConfig.h"

@interface PicoSOAPClient : AFHTTPRequestOperationManager

/**
 Target endpoint url, mandatory
 */
@property (readonly, nonatomic, strong) NSURL *endpointURL;

/**
 SOAP version used, default to SOAP11
 */
@property (readwrite, nonatomic, assign) PicoSOAPVersion soapVersion;

/**
 Should request/response be output for debugging
 */
@property (readwrite, nonatomic, assign) BOOL debug;

/**
 Configurations like encoding, date/number formatter, etc.
 Defaults will be used if not set explicitly.
 */
@property (readwrite, nonatomic, strong) PicoConfig *config;

/**
 Custom soap headers, following types are acceptable in the array:
 1. class conforms to `PicoBindable` protocol
 2. `PicoXMLElement` class
 */
@property (readwrite, nonatomic, strong) NSMutableArray *customSoapHeaders;

/**
 Additional parameters that will be appended as query string at the end of the request url
 */
@property (readwrite, nonatomic, strong) NSMutableDictionary *additionalParameters;

/**
 HTTP request timeout settting
 */
@property (readwrite, nonatomic, assign) NSTimeInterval timeoutInverval;

/**
 
 */
- (instancetype)initWithEndpointURL:(NSURL *)URL NS_DESIGNATED_INITIALIZER;

- (void) setDefaultHeader:(NSString*)header value:(NSString*)value;

- (PicoSOAPRequestOperation *)PicoSOAPRequestOperationWithRequest:(NSURLRequest *)request
                                                          success:(void (^)(PicoSOAPRequestOperation *operation, id responseObject))success
                                                          failure:(void (^)(PicoSOAPRequestOperation *operation, NSError *error))failure;

/**
 
 */
- (void)invoke:(id<PicoBindable>)requestObject responseClass:(Class)responseClazz
             success:(void (^)(PicoSOAPRequestOperation *operation, id<PicoBindable> responseObject))success
             failure:(void (^)(PicoSOAPRequestOperation *operation, NSError *error, id<PicoBindable> soapFault))failure;

@end
