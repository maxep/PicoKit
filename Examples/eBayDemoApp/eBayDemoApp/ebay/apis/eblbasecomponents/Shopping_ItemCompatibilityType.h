// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"


@class Shopping_NameValueListType;

/**
 
 All information corresponding to an individual compatibility by application.
 <br><br>
 Parts Compatibility is supported in limited Parts & Accessories categories, on the eBay Motors (US) site (site ID 100) only. If a 
 
 
 @ingroup ShoppingInterface
*/
@interface Shopping_ItemCompatibilityType : NSObject <PicoBindable> {

@private
    NSMutableArray *_nameValueList;
    NSString *_compatibilityNotes;
    NSMutableArray *_any;

}


/**
 
 Contains a list of name-value pairs which together describe a single compatible application. The allowed names and values are specific to the primary category in which the item is listed. For example, when listing in a Parts & Accessories category, where the applications are vehicles, the allowed names might include Year, Make, and Model, and the values correspond to specific vehicles in eBay's catalog.
 
 
 entry type : class Shopping_NameValueListType
*/

@property (nonatomic, strong) NSMutableArray *nameValueList;

/**
 
 The seller may optionally enter any notes pertaining to the compatibility being specified. Use this field to specify the placement of the part on a vehicle or the type of vehicle that a part fits.
 
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *compatibilityNotes;

/**
 (public property)
 
 entry type : PicoAnyElement, wrapper for primitive anyelement
*/

@property (nonatomic, strong) NSMutableArray *any;


@end