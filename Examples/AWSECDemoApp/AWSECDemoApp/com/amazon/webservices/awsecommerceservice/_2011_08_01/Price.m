// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "Price.h"

@implementation Price

@synthesize amount = _amount;
@synthesize currencyCode = _currencyCode;
@synthesize formattedPrice = _formattedPrice;

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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Amount" propertyName:@"amount" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"amount"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"CurrencyCode" propertyName:@"currencyCode" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"currencyCode"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"FormattedPrice" propertyName:@"formattedPrice" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"formattedPrice"];
    
    return map;
}




@end