//
//  DetailsViewController.h
//  AWSECDemoApp
//
//  Created by bulldog on 13-3-23.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonTypes.h"

@class CartViewController;

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) Item *item;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *listPriceLabel;
@property (nonatomic, strong) IBOutlet UILabel *authorLabel;
@property (nonatomic, strong) IBOutlet UILabel *bindingLabel;
@property (nonatomic, strong) IBOutlet UILabel *editionLabel;
@property (nonatomic, strong) IBOutlet UILabel *publisherLabel;
@property (nonatomic, strong) IBOutlet UILabel *publicationDateLabel;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) CartViewController *cartViewController;

@end
