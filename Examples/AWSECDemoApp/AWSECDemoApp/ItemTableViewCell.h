//
//  ItemTableViewCell.h
//  AWSECDemoApp
//
//  Created by bulldog on 13-3-23.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"

/**
 Diaplaying information about an item for sale
 */
@interface ItemTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *thumbnailView;
@property (nonatomic, strong) UIImageView *afImageView;

/// Creates and returns a cell loaded from the nib file
+ (ItemTableViewCell *) itemTableViewCellFromNib;

/// String matching cell's identifier in nib file
+ (NSString *) reuseIdentifier;

/// Loads item image from given URL
- (void)setImageURL:(NSString *)urlString;

@end
