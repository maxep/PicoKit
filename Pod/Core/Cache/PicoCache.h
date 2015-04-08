//
//  PicoCache.h
//  pico
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@interface PicoCache : NSObject {
@private
    NSUInteger _countLimit;
    
}

@property (nonatomic, assign, readwrite) NSUInteger countLimit;

- (instancetype) initWithCountLimit : (NSUInteger) limit NS_DESIGNATED_INITIALIZER;
- (id) objectForKey: (id)key;
- (void) setObject: (id)object forKey:(id)key;
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSArray *allKeys;
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSArray *allValues;
- (void)removeObjectForKey:(id)key;
- (void)removeAllObjects;
@property (NS_NONATOMIC_IOSONLY, readonly) NSUInteger count;

@end
