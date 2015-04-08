//
//  PicoBoolConverter.m
//  pico
//
//  Created by bulldog on 13-2-24.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

#import "PicoBoolConverter.h"

@implementation PicoBoolConverter

-(NSString *)write:(NSNumber *)value withConfig:(PicoConfig *)config {
    if ([value boolValue]) {
        return @"true";
    } else {
        return @"false";
    }
}

-(NSNumber *)read:(NSString *)value withConfig:(PicoConfig *)config {
    NSString *lower = [value lowercaseString];
    NSNumber *result = nil;
    if ([lower isEqualToString:@"true"]) {
        result = @YES;
    } else if ([lower isEqualToString:@"1"]) {
        result = @YES;
    } else {
        result = @NO;
    }
    return result;
}

@end
