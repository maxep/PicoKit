//
//  PicoFormat.h
//  pico
//
//  Created by bulldog on 13-2-26.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

extern NSString *const DEFAULT_XML_ENCODING;

@interface PicoConfig : NSObject {
@private
    NSString *_encoding;
    BOOL _indent;
    NSLocale *_locale;
    NSNumberFormatter *_numberFormatter;
    NSDateFormatter *_dateFormatter;
    NSTimeZone *_tiemZone;
}

/**
 soap message encoding, default to utf-8
 */
@property (nonatomic, strong) NSString *encoding;
/**
 locale used for number or date conversion, default to current locale on device
 */
@property (nonatomic, strong) NSLocale *locale;
/**
 formatter used for number conversion
 */
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
/**
 formatter used for date conversion, default date format : yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
 */
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
/**
 time zone used for date conversion, default to GMT time zone.
 */
@property (nonatomic, strong) NSTimeZone *timeZone;
/**
 should output message be formated with indent, default to YES
 */
@property (nonatomic, assign) BOOL indent;


@end
