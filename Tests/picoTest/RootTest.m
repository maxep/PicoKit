//
//  RootTest.m
//  picoTest
//
//  Created by bulldog on 13-2-28.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoTestBase.h"
#import "OrderedDictionary.h"


@interface RootExample : NSObject <PicoBindable>
{
@private
	NSNumber *version;
	NSString *text;
}

@property (nonatomic, strong) NSNumber *version;
@property (nonatomic, strong) NSString *text;

@end

@implementation RootExample

@synthesize version;
@synthesize text;

+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"RootExample" nsUri: nil];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	PicoPropertySchema *ps = nil;
	
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"version" propertyName:@"version" type:PICO_TYPE_INT clazz:nil];
	[map setObject:ps forKey:@"version"];
	ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"text" propertyName:@"text" type:PICO_TYPE_STRING clazz:nil];
	[map setObject:ps forKey:@"text"];
	
	return map;
}

@end

@interface ExtendedRootExample : RootExample <PicoBindable>
{
}

@end

@implementation ExtendedRootExample


+(PicoClassSchema *)getClassMetaData {
	PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName: @"ExtendedRootExample" nsUri: nil];
	return cs;
}

+(NSMutableDictionary *)getPropertyMetaData {
	NSMutableDictionary *map = [OrderedDictionary dictionary];
	
	return map;
}

@end

@interface RootTest : PicoTestBase

@end

@implementation RootTest

static const NSString *ROOT_EXAMPLE =
    @"<RootExample version='1'>\
        <text>Some text example</text>\
    </RootExample>";

static const NSString *EXTENDED_ROOT_EXAMPLE =
    @"<ExtendedRootExample version='1'>\
        <text>Some text example</text>\
    </ExtendedRootExample>";

-(void)testRoot {
	NSData *xmlData = [ROOT_EXAMPLE dataUsingEncoding: NSUTF8StringEncoding];
	
	RootExample *re = [xmlReader fromData:xmlData withClass:[RootExample class]];
	
	GHAssertTrue([re.version intValue] == 1, nil);
	GHAssertEqualStrings(re.text, @"Some text example", nil);
	
	xmlData = [EXTENDED_ROOT_EXAMPLE dataUsingEncoding: NSUTF8StringEncoding];
	re = [xmlReader fromData:xmlData withClass:[ExtendedRootExample class]];
	GHAssertTrue([re.version intValue] == 1, nil);
	GHAssertEqualStrings(re.text, @"Some text example", nil);
	
}

@end
