//
//  ViewController.h
//  BarCode
//
//  Created by bulldog on 13-3-20.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *dataToEncode;
@property (nonatomic, strong) IBOutlet UIImageView *barcodeImage;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

-(IBAction)buttonPressed:(id)sender;

@end
