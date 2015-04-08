// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "ForecastReturn.h"
#import "ArrayOfForecast.h"

@implementation ForecastReturn

@synthesize success = _success;
@synthesize responseText = _responseText;
@synthesize state = _state;
@synthesize city = _city;
@synthesize weatherStationCity = _weatherStationCity;
@synthesize forecastResult = _forecastResult;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"ForecastReturn" nsUri:@"http://ws.cdyne.com/WeatherWS/"];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [OrderedDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Success" propertyName:@"success" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"success"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ResponseText" propertyName:@"responseText" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"responseText"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"State" propertyName:@"state" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"state"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"City" propertyName:@"city" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"city"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"WeatherStationCity" propertyName:@"weatherStationCity" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"weatherStationCity"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"ForecastResult" propertyName:@"forecastResult" type:PICO_TYPE_OBJECT clazz:[ArrayOfForecast class]];
    [map setObject:ps forKey:@"forecastResult"];
    
    return map;
}



-(void)dealloc {
    self.success = nil;
    self.responseText = nil;
    self.state = nil;
    self.city = nil;
    self.weatherStationCity = nil;
    self.forecastResult = nil;
}

@end