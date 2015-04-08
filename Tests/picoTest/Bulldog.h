//
//  Bulldog.h
//  picoTest
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoBindable.h"

@interface Bulldog : NSObject <PicoBindable> {

@private
    NSString *name;
    NSNumber *age;
    NSString *color;
    NSString *desc;
    NSMutableArray *children;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSMutableArray *children;

@end
