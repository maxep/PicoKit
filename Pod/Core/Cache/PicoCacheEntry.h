//
//  PicoCacheEntry.h
//  pico
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@interface PicoCacheEntry : NSObject {
@private
    id _key;
    id _object;
    
}

@property (nonatomic, strong, readwrite) id key;
@property (nonatomic, strong, readwrite) id object;


-(instancetype) initWithObject:(id)obj forKey:(id)key NS_DESIGNATED_INITIALIZER;

@end
