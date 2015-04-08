//
//  NamespaceTest.m
//  picoTest
//
//  Created by bulldog on 13-2-28.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"
#import "OrderedDictionary.h"

@class Bbb;

@interface Aaa : NSObject <PicoBindable>
{
@private
	Bbb *bbb;
	
}

@property (nonatomic, strong) Bbb *bbb;

@end

@interface Bbb : NSObject <PicoBindable>
{
@private
    Aaa *aaa;
    
}

@property (nonatomic, strong) Aaa *aaa;

@end

@implementation Aaa

@synthesize bbb;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"aaa" nsUri: @"namespace1"];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"bbb" propertyName:@"bbb" type:PICO_TYPE_OBJECT clazz:[Bbb class]];
	[map setObject:ps forKey:@"bbb"];
	
	return map;
}


@end

@implementation Bbb

@synthesize aaa;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"bbb" nsUri: @"namespace2"];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"aaa" propertyName:@"aaa" type:PICO_TYPE_OBJECT clazz:[Aaa class]];
	[map setObject:ps forKey:@"aaa"];
	
	return map;
}

@end

@interface NamespaceTest : PicoTestBase

@end

@implementation NamespaceTest

-(void)testNamespace {
	Aaa *parent = [Aaa new];
	Bbb *child = [Bbb new];
	parent.bbb = child;
	Aaa *grandchild = [Aaa new];
	child.aaa = grandchild;
	grandchild.bbb = [Bbb new];
	
	NSData *xmlData = [xmlWriter toData:parent];
	
	NSString *xmlString = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
	
	GHTestLog(@"marshal result : %@", xmlString);
	
	
}

@end
