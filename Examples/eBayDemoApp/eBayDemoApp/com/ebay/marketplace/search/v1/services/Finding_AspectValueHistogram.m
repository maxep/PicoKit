// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "Finding_AspectValueHistogram.h"

@implementation Finding_AspectValueHistogram

@synthesize count = _count;
@synthesize any = _any;
@synthesize valueName = _valueName;

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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"count" propertyName:@"count" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"count"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"valueName" propertyName:@"valueName" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"valueName"];
    
    return map;
}




@end