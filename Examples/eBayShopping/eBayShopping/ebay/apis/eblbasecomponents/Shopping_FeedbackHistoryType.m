// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "Shopping_FeedbackHistoryType.h"
#import "Shopping_AverageRatingDetailsType.h"
#import "Shopping_FeedbackPeriodType.h"

@implementation Shopping_FeedbackHistoryType

@synthesize bidRetractionFeedbackPeriods = _bidRetractionFeedbackPeriods;
@synthesize negativeFeedbackPeriods = _negativeFeedbackPeriods;
@synthesize neutralFeedbackPeriods = _neutralFeedbackPeriods;
@synthesize positiveFeedbackPeriods = _positiveFeedbackPeriods;
@synthesize totalFeedbackPeriods = _totalFeedbackPeriods;
@synthesize uniqueNegativeFeedbackCount = _uniqueNegativeFeedbackCount;
@synthesize uniquePositiveFeedbackCount = _uniquePositiveFeedbackCount;
@synthesize averageRatingDetails = _averageRatingDetails;
@synthesize neutralCommentCountFromSuspendedUsers = _neutralCommentCountFromSuspendedUsers;
@synthesize uniqueNeutralFeedbackCount = _uniqueNeutralFeedbackCount;
@synthesize any = _any;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    return nil;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [OrderedDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"BidRetractionFeedbackPeriods" propertyName:@"bidRetractionFeedbackPeriods" type:PICO_TYPE_OBJECT clazz:[Shopping_FeedbackPeriodType class]];
    [map setObject:ps forKey:@"bidRetractionFeedbackPeriods"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"NegativeFeedbackPeriods" propertyName:@"negativeFeedbackPeriods" type:PICO_TYPE_OBJECT clazz:[Shopping_FeedbackPeriodType class]];
    [map setObject:ps forKey:@"negativeFeedbackPeriods"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"NeutralFeedbackPeriods" propertyName:@"neutralFeedbackPeriods" type:PICO_TYPE_OBJECT clazz:[Shopping_FeedbackPeriodType class]];
    [map setObject:ps forKey:@"neutralFeedbackPeriods"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"PositiveFeedbackPeriods" propertyName:@"positiveFeedbackPeriods" type:PICO_TYPE_OBJECT clazz:[Shopping_FeedbackPeriodType class]];
    [map setObject:ps forKey:@"positiveFeedbackPeriods"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"TotalFeedbackPeriods" propertyName:@"totalFeedbackPeriods" type:PICO_TYPE_OBJECT clazz:[Shopping_FeedbackPeriodType class]];
    [map setObject:ps forKey:@"totalFeedbackPeriods"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"UniqueNegativeFeedbackCount" propertyName:@"uniqueNegativeFeedbackCount" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"uniqueNegativeFeedbackCount"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"UniquePositiveFeedbackCount" propertyName:@"uniquePositiveFeedbackCount" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"uniquePositiveFeedbackCount"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"AverageRatingDetails" propertyName:@"averageRatingDetails" type:PICO_TYPE_OBJECT clazz:[Shopping_AverageRatingDetailsType class]];
    [map setObject:ps forKey:@"averageRatingDetails"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"NeutralCommentCountFromSuspendedUsers" propertyName:@"neutralCommentCountFromSuspendedUsers" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"neutralCommentCountFromSuspendedUsers"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"UniqueNeutralFeedbackCount" propertyName:@"uniqueNeutralFeedbackCount" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"uniqueNeutralFeedbackCount"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    
    return map;
}



-(void)dealloc {
    self.bidRetractionFeedbackPeriods = nil;
    self.negativeFeedbackPeriods = nil;
    self.neutralFeedbackPeriods = nil;
    self.positiveFeedbackPeriods = nil;
    self.totalFeedbackPeriods = nil;
    self.uniqueNegativeFeedbackCount = nil;
    self.uniquePositiveFeedbackCount = nil;
    self.averageRatingDetails = nil;
    self.neutralCommentCountFromSuspendedUsers = nil;
    self.uniqueNeutralFeedbackCount = nil;
    self.any = nil;
}

@end
