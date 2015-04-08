//
//  ViewController.h
//  CurrencyConverter
//
//  Created by bulldog on 13-3-19.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *fromCurrencyTextField;
@property (strong, nonatomic) IBOutlet UITextField *toCurrencyTextField;
@property (strong, nonatomic) IBOutlet UIButton *convertButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
