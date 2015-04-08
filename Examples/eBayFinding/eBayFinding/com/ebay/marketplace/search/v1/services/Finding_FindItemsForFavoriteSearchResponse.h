// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Finding_BaseFindingServiceResponse.h"


@class Finding_CategoryHistogramContainer;
@class Finding_AspectHistogramContainer;
@class Finding_ConditionHistogramContainer;

/**
 
 Reserved for future use.
 
 
 @ingroup FindingServicePortType
*/
@interface Finding_FindItemsForFavoriteSearchResponse : Finding_BaseFindingServiceResponse {

@private
    Finding_CategoryHistogramContainer *_categoryHistogramContainer;
    Finding_AspectHistogramContainer *_aspectHistogramContainer;
    Finding_ConditionHistogramContainer *_conditionHistogramContainer;

}


/**
 
 Reserved for future use.
 
 
 type : class Finding_CategoryHistogramContainer
*/
@property (nonatomic, retain) Finding_CategoryHistogramContainer *categoryHistogramContainer;

/**
 
 Reserved for future use.
 
 
 type : class Finding_AspectHistogramContainer
*/
@property (nonatomic, retain) Finding_AspectHistogramContainer *aspectHistogramContainer;

/**
 
 Reserved for future use.
 
 
 type : class Finding_ConditionHistogramContainer
*/
@property (nonatomic, retain) Finding_ConditionHistogramContainer *conditionHistogramContainer;


@end