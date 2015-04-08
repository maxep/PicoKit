// Generated by wsdl compiler for ios/objective-c
// DO NOT CHANGE!


#import <Foundation/Foundation.h>
#import "PicoXMLClient.h"
#import "CartAdd.h"
#import "BrowseNodeLookup.h"
#import "CartClearResponse.h"
#import "ItemSearch.h"
#import "CartModifyResponse.h"
#import "ItemLookupResponse.h"
#import "ItemSearchResponse.h"
#import "SimilarityLookup.h"
#import "CartGet.h"
#import "CartModify.h"
#import "CartCreate.h"
#import "SimilarityLookupResponse.h"
#import "CartCreateResponse.h"
#import "BrowseNodeLookupResponse.h"
#import "CartClear.h"
#import "CartGetResponse.h"
#import "CartAddResponse.h"
#import "ItemLookup.h"


/**
 This class is the XML client to the AWSECommerceServicePortType Web Service.
*/ 
@interface AWSECommerceServicePortType_XMLClient : PicoXMLClient {

}

/**
 public method
*/
-(void)itemSearch:(ItemSearch *) requestObject 
      success:(void (^)(ItemSearchResponse *responseObject))success
      failure:(void (^)(NSError *error))failure;

/**
 public method
*/
-(void)itemLookup:(ItemLookup *) requestObject 
      success:(void (^)(ItemLookupResponse *responseObject))success
      failure:(void (^)(NSError *error))failure;

/**
 public method
*/
-(void)browseNodeLookup:(BrowseNodeLookup *) requestObject 
      success:(void (^)(BrowseNodeLookupResponse *responseObject))success
      failure:(void (^)(NSError *error))failure;

/**
 public method
*/
-(void)similarityLookup:(SimilarityLookup *) requestObject 
      success:(void (^)(SimilarityLookupResponse *responseObject))success
      failure:(void (^)(NSError *error))failure;

/**
 public method
*/
-(void)cartGet:(CartGet *) requestObject 
      success:(void (^)(CartGetResponse *responseObject))success
      failure:(void (^)(NSError *error))failure;

/**
 public method
*/
-(void)cartCreate:(CartCreate *) requestObject 
      success:(void (^)(CartCreateResponse *responseObject))success
      failure:(void (^)(NSError *error))failure;

/**
 public method
*/
-(void)cartAdd:(CartAdd *) requestObject 
      success:(void (^)(CartAddResponse *responseObject))success
      failure:(void (^)(NSError *error))failure;

/**
 public method
*/
-(void)cartModify:(CartModify *) requestObject 
      success:(void (^)(CartModifyResponse *responseObject))success
      failure:(void (^)(NSError *error))failure;

/**
 public method
*/
-(void)cartClear:(CartClear *) requestObject 
      success:(void (^)(CartClearResponse *responseObject))success
      failure:(void (^)(NSError *error))failure;


@end