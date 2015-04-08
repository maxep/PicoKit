//
//  DetailsViewController.h
//  eBayDemoApp
//
//  Created by bulldog on 13-3-24.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shopping_GetSingleItemRequestType.h"

@class Finding_SearchItem;
@interface DetailsViewController : UIViewController {
    Shopping_GetSingleItemRequestType *_currentGetSingleItemRequest;
}

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceTypeLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceLabel;
@property (nonatomic, strong) IBOutlet UILabel *itemIDLabel;
@property (nonatomic, strong) IBOutlet UILabel *startTimeLabel;
@property (nonatomic, strong) IBOutlet UILabel *endTimeLabel;
@property (nonatomic, strong) IBOutlet UILabel *timeLeftLabel;
@property (nonatomic, strong) IBOutlet UILabel *conditionLabel;
@property (nonatomic, strong) IBOutlet UILabel *listingTypeLabel;
@property (nonatomic, strong) IBOutlet UILabel *shippingCostLabel;
@property (nonatomic, strong) IBOutlet UILabel *locationLabel;
@property (nonatomic, strong) IBOutlet UILabel *paymentMethodLabel;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) Finding_SearchItem *selectedItem;
@property (nonatomic, assign) BOOL isFixedPrice;

- (IBAction)viewOneBayMobileWeb:(id)sender;

@end
