//
//  PicoConverter.m
//  pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoConverter.h"
#import "PicoConstants.h"
#import "PicoNumberConverter.h"
#import "PicoBoolConverter.h"
#import "PicoStringConverter.h"
#import "PicoConvertable.h"
#import "PicoDateConverter.h"
#import "PicoDataConverter.h"

@implementation PicoConverter

static NSMutableDictionary *cache = nil;

+ (void) initialize {
	cache = [[NSMutableDictionary alloc] init];
	
	id <PicoConvertable> converter = nil;
	
	// pre-initialize converters
	converter = [[PicoStringConverter alloc] init];
	cache[PICO_TYPE_STRING] = converter;
	
	converter = [[PicoNumberConverter alloc] init];
	cache[PICO_TYPE_INT] = converter;
	
	converter = [[PicoNumberConverter alloc] init];
	cache[PICO_TYPE_DOUBLE] = converter;
	
	converter = [[PicoNumberConverter alloc] init];
	cache[PICO_TYPE_SHORT] = converter;
	
	converter = [[PicoNumberConverter alloc] init];
	cache[PICO_TYPE_LONG] = converter;
	
	converter = [[PicoNumberConverter alloc] init];
	cache[PICO_TYPE_FLOAT] = converter;
	
	converter = [[PicoBoolConverter alloc] init];
	cache[PICO_TYPE_BOOL] = converter;
	
	converter = [[PicoStringConverter alloc] init];
	cache[PICO_TYPE_ENUM] = converter;
	
	converter = [[PicoDateConverter alloc] init];
	cache[PICO_TYPE_DATE] = converter;
    
	converter = [[PicoStringConverter alloc] init];
	cache[PICO_TYPE_DURATION] = converter;
	
	converter = [[PicoStringConverter alloc] init];
	cache[PICO_TYPE_CHAR] = converter;
    
    converter = [[PicoStringConverter alloc] init];
	cache[PICO_TYPE_QNAME] = converter;
	
	converter = [[PicoNumberConverter alloc] init];
	cache[PICO_TYPE_BYTE] = converter;
    
    converter = [[PicoDataConverter alloc] init];
    cache[PICO_TYPE_DATA] = converter;
}

+(id)read: (NSString *)value withType: (NSString *)type config:(PicoConfig *)config {
	id <PicoConvertable> converter = [PicoConverter lookup:type];
	if (converter == nil) {
		@throw [NSException exceptionWithName:@"ConverterException" reason:[NSString stringWithFormat:@"no converter found for type : %@", type] userInfo:nil];
	}
	return [converter read:value withConfig:config];
}

+(NSString *)write: (id)value withType: (NSString *)type config:(PicoConfig *)config {
	id <PicoConvertable> converter = [PicoConverter lookup:type];
	if (converter == nil) {
		@throw [NSException exceptionWithName:@"ConverterException" reason:[NSString stringWithFormat:@"no converter found for type : %@", type] userInfo:nil];
	}
	return [converter write:value withConfig:config];
}

+(BOOL) isPrimitive:(NSString *)type {
	return [PicoConverter lookup:type] != nil;
}

+(id <PicoConvertable>)lookup: (NSString *)type {
	
	id <PicoConvertable> converter = cache[type];
	return converter;
    
}

@end
