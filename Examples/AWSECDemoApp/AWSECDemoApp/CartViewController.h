//
//  CartViewController.h
//  AWSECDemoApp
//
//  Created by user on 13-3-24.
//  Copyright (c) 2013年 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cart;

@interface CartViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *cartId;
@property (nonatomic, strong) IBOutlet UILabel *productId;
@property (nonatomic, strong) IBOutlet UILabel *price;
@property (nonatomic, strong) IBOutlet UILabel *seller;
@property (nonatomic, strong) IBOutlet UILabel *quantity;
@property (nonatomic, strong) Cart *cart;

-(IBAction)purchaseButtonPresssed:(id)sender;

@end
