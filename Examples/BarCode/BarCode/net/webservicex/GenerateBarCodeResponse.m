// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "GenerateBarCodeResponse.h"

@implementation GenerateBarCodeResponse

@synthesize generateBarCodeResult = _generateBarCodeResult;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"GenerateBarCodeResponse" nsUri:@"http://www.webservicex.net/"];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [OrderedDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"GenerateBarCodeResult" propertyName:@"generateBarCodeResult" type:PICO_TYPE_DATA clazz:nil];
    [map setObject:ps forKey:@"generateBarCodeResult"];
    
    return map;
}



-(void)dealloc {
    self.generateBarCodeResult = nil;
}

@end
