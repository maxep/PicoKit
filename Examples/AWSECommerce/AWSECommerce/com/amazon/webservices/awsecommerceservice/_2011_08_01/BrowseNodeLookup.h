// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"


@class BrowseNodeLookupRequest;

/**
 (public class)
 
 @ingroup AWSECommerceServicePortType
*/
@interface BrowseNodeLookup : NSObject <PicoBindable> {

@private
    NSString *_marketplaceDomain;
    NSString *_awsAccessKeyId;
    NSString *_associateTag;
    NSString *_validate;
    NSString *_xmlEscaping;
    BrowseNodeLookupRequest *_shared;
    NSMutableArray *_request;

}


/**
 (public property)
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *marketplaceDomain;

/**
 (public property)
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *awsAccessKeyId;

/**
 (public property)
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *associateTag;

/**
 (public property)
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *validate;

/**
 (public property)
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *xmlEscaping;

/**
 (public property)
 
 type : class BrowseNodeLookupRequest
*/
@property (nonatomic, strong) BrowseNodeLookupRequest *shared;

/**
 (public property)
 
 entry type : class BrowseNodeLookupRequest
*/

@property (nonatomic, strong) NSMutableArray *request;


@end
