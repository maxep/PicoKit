// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "TopItem.h"

@implementation TopItem

@synthesize asin = _asin;
@synthesize title = _title;
@synthesize detailPageURL = _detailPageURL;
@synthesize productGroup = _productGroup;
@synthesize author = _author;
@synthesize artist = _artist;
@synthesize actor = _actor;

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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ASIN" propertyName:@"asin" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"asin"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Title" propertyName:@"title" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"title"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"DetailPageURL" propertyName:@"detailPageURL" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"detailPageURL"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ProductGroup" propertyName:@"productGroup" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"productGroup"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"Author" propertyName:@"author" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"author"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"Artist" propertyName:@"artist" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"artist"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"Actor" propertyName:@"actor" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"actor"];
    
    return map;
}




@end