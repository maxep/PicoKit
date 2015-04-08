//
//  PicoXMLReader.h
//  Pico
//
//  Created by bulldog on 13-3-11.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoReadable.h"
#import "PicoConfig.h"

@class PicoConfig;
@class GDataXMLElement;
@interface PicoXMLReader : NSObject <PicoReadable> {
@private
    PicoConfig *_config;
    
}

@property (nonatomic, strong) PicoConfig *config;

- (instancetype) initWithConfig:(PicoConfig *)config NS_DESIGNATED_INITIALIZER;

@end
