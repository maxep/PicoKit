// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "Shopping_CategoryArrayType.h"
#import "Shopping_CategoryType.h"

@implementation Shopping_CategoryArrayType

@synthesize category = _category;

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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"Category" propertyName:@"category" type:PICO_TYPE_OBJECT clazz:[Shopping_CategoryType class]];
    [map setObject:ps forKey:@"category"];
    
    return map;
}




@end