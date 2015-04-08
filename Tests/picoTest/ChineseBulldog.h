//
//  ChineseBulldog.h
//  picoTest
//
//  Created by bulldog on 13-2-25.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "Bulldog.h"

@interface ChineseBulldog : Bulldog {
@private
    NSString *__weak native;
}

@property (nonatomic, weak) NSString *native;

@end
