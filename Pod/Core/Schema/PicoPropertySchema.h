//
//  PicoPropertySchema.h
//  Pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicoPropertySchema : NSObject

// property kind
@property (nonatomic, weak) NSString *propertyKind;
// xml name
@property (nonatomic, weak) NSString *xmlName;
// property name
@property (nonatomic, weak) NSString *propertyName;
// property type
@property (nonatomic, weak) NSString *propertyType;
// class name of the type
@property (nonatomic, weak) Class clazz;

-(instancetype)initWithKind: (NSString *)pKind xmlName: (NSString *)xName propertyName: (NSString *)proName type: (NSString *)pType clazz: (Class)clz NS_DESIGNATED_INITIALIZER;

@end
