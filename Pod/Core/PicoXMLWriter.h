//
//  PicoXMLWriter.h
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoWritable.h"

@class PicoConfig;
@interface PicoXMLWriter : NSObject <PicoWritable> {
    PicoConfig *_config;
    int _autoPrefixCount;
}

@property (nonatomic, strong) PicoConfig *config;

- (instancetype) initWithConfig:(PicoConfig *)config NS_DESIGNATED_INITIALIZER;

@end
