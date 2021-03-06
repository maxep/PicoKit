// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Finding_BestMatchFindingServiceRequest.h"

// abstract class


/**
 
 This is the base request container for all Finding Service operations.
 
 
 @ingroup FindingServicePortType
*/
@interface Finding_BaseFindingServiceRequest : Finding_BestMatchFindingServiceRequest {

@private
    NSString *_sortOrder;

}


/**
 
 Sort the returned items according to a single specified sort order.
 
 
 type: string constant in Finding_SortOrderType.h
*/
@property (nonatomic, strong) NSString *sortOrder;


@end
