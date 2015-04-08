//
//  Bulldog.m
//  picoTest
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "Bulldog.h"
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "OrderedDictionary.h"

@implementation Bulldog

@synthesize name;
@synthesize age;
@synthesize color;
@synthesize desc;
@synthesize children;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"MyPet" nsUri:@"a.b.c"];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
    
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Name" propertyName:@"name" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"name"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"Age" propertyName:@"age" type:PICO_TYPE_INT clazz:nil];
	[map setObject:ps forKey:@"age"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"Color" propertyName:@"color" type:PICO_TYPE_ENUM clazz:nil];
	[map setObject:ps forKey:@"color"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"Desc" propertyName:@"desc" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"desc"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"Children" propertyName:@"children" type:PICO_TYPE_OBJECT clazz:[Bulldog class]];
	[map setObject:ps forKey:@"children"];
	
	return map;
}


@end
