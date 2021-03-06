// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"



/**
 (public class)
 
 @ingroup AWSECommerceServicePortType
*/
@interface AvailabilityAttributes : NSObject <PicoBindable> {

@private
    NSString *_availabilityType;
    NSNumber *_isPreorder;
    NSNumber *_minimumHours;
    NSNumber *_maximumHours;

}


/**
 (public property)
 
 type : NSString, wrapper for primitive string
*/
@property (nonatomic, strong) NSString *availabilityType;

/**
 (public property)
 
 type : NSNumber, wrapper for primitive bool
*/
@property (nonatomic, strong) NSNumber *isPreorder;

/**
 (public property)
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, strong) NSNumber *minimumHours;

/**
 (public property)
 
 type : NSNumber, wrapper for primitive long
*/
@property (nonatomic, strong) NSNumber *maximumHours;


@end
