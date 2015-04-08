//
//  TyteTest.m
//  picoTest
//
//  Created by bulldog on 13-2-28.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//
#import "PicoTestBase.h"
#import "OrderedDictionary.h"

@interface TyteTest : PicoTestBase

@end

@interface ObjectEntry : NSObject <PicoBindable>
{
@private
	NSNumber *booleanValue;
	NSNumber *byteValue;
	NSNumber *shortValue;
	NSNumber *intValue;
	NSNumber *floatValue;
	NSNumber *longValue;
	NSNumber *doubleValue;
	NSNumber *stringValue;
}

@property (nonatomic, strong) NSNumber *booleanValue;
@property (nonatomic, strong) NSNumber *byteValue;
@property (nonatomic, strong) NSNumber *shortValue;
@property (nonatomic, strong) NSNumber *intValue;
@property (nonatomic, strong) NSNumber *floatValue;
@property (nonatomic, strong) NSNumber *longValue;
@property (nonatomic, strong) NSNumber *doubleValue;
@property (nonatomic, strong) NSNumber *stringValue;

@end

@implementation ObjectEntry

@synthesize booleanValue;
@synthesize byteValue;
@synthesize shortValue;
@synthesize intValue;
@synthesize floatValue;
@synthesize longValue;
@synthesize doubleValue;
@synthesize stringValue;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"objectEntry" nsUri: nil];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Boolean" propertyName:@"booleanValue" type:PICO_TYPE_BOOL clazz:nil];
	[map setObject:ps forKey:@"booleanValue"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Byte" propertyName:@"byteValue" type:PICO_TYPE_BYTE clazz:nil];
	[map setObject:ps forKey:@"byteValue"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Short" propertyName:@"shortValue" type:PICO_TYPE_SHORT clazz:nil];
	[map setObject:ps forKey:@"shortValue"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Integer" propertyName:@"intValue" type:PICO_TYPE_INT clazz:nil];
	[map setObject:ps forKey:@"intValue"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Float" propertyName:@"floatValue" type:PICO_TYPE_FLOAT clazz:nil];
	[map setObject:ps forKey:@"floatValue"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Long" propertyName:@"longValue" type:PICO_TYPE_LONG clazz:nil];
	[map setObject:ps forKey:@"longValue"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Double" propertyName:@"doubleValue" type:PICO_TYPE_DOUBLE clazz:nil];
	[map setObject:ps forKey:@"doubleValue"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"String" propertyName:@"stringValue" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"stringValue"];
	
	return map;
}

@end

@interface TypeEntry : NSObject <PicoBindable>
{
@private
	ObjectEntry *object;
}

@property (nonatomic, strong) ObjectEntry *object;

@end

@implementation TypeEntry

@synthesize object;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"test" nsUri: nil];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"object" propertyName:@"object" type:PICO_TYPE_OBJECT clazz:[ObjectEntry class]];
	[map setObject:ps forKey:@"object"];
	
	return map;
}

@end

@implementation TyteTest

static const NSString *SOURCE =
    @"<?xml version=\"1.0\"?>\
    <test>\
        <object>\
            <Boolean>true</Boolean>\
            <Byte>16</Byte>\
            <Short>120</Short>\
            <Integer>1234</Integer>\
            <Float>1234.56</Float>\
            <Long>1234567</Long>\
            <Double>1234567.89</Double>\
            <String>text value</String>\
        </object>\
    </test>";

-(void)testType {
    
	NSData *xmlData = [SOURCE dataUsingEncoding: NSUTF8StringEncoding];
	
	TypeEntry *te = [xmlReader fromData:xmlData withClass:[TypeEntry class]];
	
	ObjectEntry *oe = te.object;
	GHAssertTrue([oe.booleanValue boolValue], nil);
	GHAssertTrue([oe.byteValue intValue] == 16, nil);
	GHAssertTrue([oe.shortValue shortValue] == 120, nil);
	GHAssertTrue([oe.intValue intValue ] == 1234, nil);
	GHAssertTrue(abs([oe.floatValue floatValue] - 1234.56) <= 1e-6, nil);
	GHAssertTrue([oe.longValue longValue] == 1234567, nil);
	GHAssertTrue([oe.doubleValue doubleValue] == 1234567.89, nil);
	GHAssertEqualStrings(oe.stringValue, @"text value", nil);
	
	xmlData = [xmlWriter toData:te];
	
	NSString *xmlString = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
	
	GHTestLog(@"write result : %@", xmlString);
	
	te = [xmlReader fromData:xmlData withClass:[TypeEntry class]];
	oe = te.object;
	GHAssertTrue([oe.booleanValue boolValue], nil);
	GHAssertTrue([oe.byteValue intValue] == 16, nil);
	GHAssertTrue([oe.shortValue shortValue] == 120, nil);
	GHAssertTrue([oe.intValue intValue ] == 1234, nil);
	GHAssertTrue(abs([oe.floatValue floatValue] - 1234.56) <= 1e-6, nil);
	GHAssertTrue([oe.longValue longValue] == 1234567, nil);
	GHAssertTrue([oe.doubleValue doubleValue] == 1234567.89, nil);
	GHAssertEqualStrings(oe.stringValue, @"text value", nil);
	
}

@end
