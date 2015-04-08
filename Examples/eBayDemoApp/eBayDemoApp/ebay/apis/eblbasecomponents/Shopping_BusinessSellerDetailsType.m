// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"
#import "Shopping_BusinessSellerDetailsType.h"
#import "Shopping_AddressType.h"
#import "Shopping_VATDetailsType.h"

@implementation Shopping_BusinessSellerDetailsType

@synthesize address = _address;
@synthesize fax = _fax;
@synthesize email = _email;
@synthesize additionalContactInformation = _additionalContactInformation;
@synthesize tradeRegistrationNumber = _tradeRegistrationNumber;
@synthesize legalInvoice = _legalInvoice;
@synthesize termsAndConditions = _termsAndConditions;
@synthesize vatDetails = _vatDetails;
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
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Address" propertyName:@"address" type:PICO_TYPE_OBJECT clazz:[Shopping_AddressType class]];
    [map setObject:ps forKey:@"address"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Fax" propertyName:@"fax" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"fax"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Email" propertyName:@"email" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"email"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"AdditionalContactInformation" propertyName:@"additionalContactInformation" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"additionalContactInformation"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"TradeRegistrationNumber" propertyName:@"tradeRegistrationNumber" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"tradeRegistrationNumber"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"LegalInvoice" propertyName:@"legalInvoice" type:PICO_TYPE_BOOL clazz:nil];
    [map setObject:ps forKey:@"legalInvoice"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"TermsAndConditions" propertyName:@"termsAndConditions" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"termsAndConditions"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"VATDetails" propertyName:@"vatDetails" type:PICO_TYPE_OBJECT clazz:[Shopping_VATDetailsType class]];
    [map setObject:ps forKey:@"vatDetails"];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ANY_ELEMENT xmlName:@"any" propertyName:@"any" type:PICO_TYPE_ANYELEMENT clazz:nil];
    [map setObject:ps forKey:@"any"];
    
    return map;
}




@end