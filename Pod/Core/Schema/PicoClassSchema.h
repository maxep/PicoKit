//
//  PicoClassSchema.h
//  Pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicoClassSchema : NSObject

// xml name
@property (nonatomic, weak) NSString *xmlName;
// namespace URI
@property (nonatomic, weak) NSString *nsURI;

-(instancetype)initWithXmlName:(NSString *)name nsUri: (NSString *)uri NS_DESIGNATED_INITIALIZER;

@end
