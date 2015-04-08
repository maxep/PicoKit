//
//  PicoXMLElement.h
//  pico
//
//  Created by bulldog on 13-3-4.
//  Copyright (c) 2013 LeanSoft Technology. All rights reserved.
//

@interface PicoXMLElement : NSObject {

@private
    NSString *_name; // element name
    NSString *_nsUri; // element namespace
    NSString *_value; // element text if any
    NSMutableArray *_children; // children of the element
    NSDictionary *_attributes; // attributes of the element
}

// nonretained
@property (nonatomic, weak) PicoXMLElement *parent;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *nsUri;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSMutableArray *children;
@property (nonatomic, strong) NSDictionary *attributes;

@end
