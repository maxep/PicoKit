// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "Shopping_GetItemStatusResponseType.h"
#import "Shopping_SimpleItemType.h"

@implementation Shopping_GetItemStatusResponseType

@synthesize item = _item;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"GetItemStatusResponse" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [OrderedDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"Item" propertyName:@"item" type:PICO_TYPE_OBJECT clazz:[Shopping_SimpleItemType class]];
    [map setObject:ps forKey:@"item"];
    
    return map;
}



-(void)dealloc {
    self.item = nil;
}

@end