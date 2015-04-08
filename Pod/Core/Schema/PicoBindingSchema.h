//
//  PicoBindingSchema.h
//  pico
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@class PicoClassSchema;
@class PicoPropertySchema;
@interface PicoBindingSchema : NSObject {
	
@private
	PicoClassSchema *__weak _classSchema;
	NSMutableDictionary *_xml2AttributeSchemaMapping;
	NSMutableDictionary *_xml2ElementSchemaMapping;
	PicoPropertySchema *__weak _valueSchema;
    PicoPropertySchema *__weak _anyElementSchema;
	NSMutableDictionary *_property2ElementSchemaMapping;
	NSMutableDictionary *_property2AttributeSchemaMapping;
	NSString *__weak _className;
}

@property (weak, nonatomic, readonly) PicoClassSchema *classSchema;
@property (nonatomic, readonly) NSMutableDictionary *xml2AttributeSchemaMapping;
@property (nonatomic, readonly) NSMutableDictionary *xml2ElementSchemaMapping;
@property (weak, nonatomic, readonly) PicoPropertySchema  *valueSchema;
@property (weak, nonatomic, readonly) PicoPropertySchema  *anyElementSchema;
@property (nonatomic, readonly) NSMutableDictionary *property2ElementSchemaMapping;
@property (nonatomic, readonly) NSMutableDictionary *property2AttributeSchemaMapping;
@property (weak, nonatomic, readonly) NSString *className;

-(instancetype)initWith: (Class)clazz NS_DESIGNATED_INITIALIZER;

+(id)fromClass: (Class)clazz;
+(id)fromObject: (id)object;

-(void)buildMapping:(NSMutableDictionary *)map;

@end
