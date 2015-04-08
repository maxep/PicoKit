// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "Shopping_PopularSearchesType.h"

@implementation Shopping_PopularSearchesType

@synthesize categoryID = _categoryID;
@synthesize categoryParentID = _categoryParentID;
@synthesize queryKeywords = _queryKeywords;
@synthesize alternativeSearches = _alternativeSearches;
@synthesize relatedSearches = _relatedSearches;
@synthesize categoryName = _categoryName;
@synthesize categoryParentName = _categoryParentName;
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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"CategoryID" propertyName:@"categoryID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"categoryID"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"CategoryParentID" propertyName:@"categoryParentID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"categoryParentID"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"QueryKeywords" propertyName:@"queryKeywords" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"queryKeywords"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"AlternativeSearches" propertyName:@"alternativeSearches" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"alternativeSearches"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"RelatedSearches" propertyName:@"relatedSearches" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"relatedSearches"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"CategoryName" propertyName:@"categoryName" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"categoryName"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"CategoryParentName" propertyName:@"categoryParentName" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"categoryParentName"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    
    return map;
}




@end