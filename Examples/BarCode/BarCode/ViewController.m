//
//  ViewController.m
//  BarCode
//
//  Created by bulldog on 13-3-20.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "BarCodeServiceClient.h"
#import "CommonTypes.h"
#import "SOAP11Fault.h"

@interface ViewController ()
@property (nonatomic, strong) IBOutlet UITextField *dataToEncode;
@property (nonatomic, strong) IBOutlet UIImageView *barcodeImage;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation ViewController

#pragma mark - view life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.activityIndicator.hidden = YES;
}

#pragma mark - UI Event Handlers

-(IBAction)buttonPressed:(id)sender {
    [self.dataToEncode resignFirstResponder];
    
    if (!self.dataToEncode.text.length) {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Invalid Parameters" message:@"Please enter valid data to encode and try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    
    // get shared client
    BarCodeServiceClient *client = [BarCodeServiceClient sharedClient];
    client.debug = YES; // enable message logging
    
    // build request
    BarCodeData *barCodeData = [[BarCodeData alloc] init];
    barCodeData.height              = [NSNumber numberWithFloat:self.barcodeImage.frame.size.height];
    barCodeData.width               = [NSNumber numberWithFloat:self.barcodeImage.frame.size.width];
    barCodeData.angle               = @0;
    barCodeData.ratio               = @5;
    barCodeData.module              = @0;
    barCodeData.left                = @25;
    barCodeData.top                 = @0;
    barCodeData.checkSum            = @0;
    barCodeData.fontName            = @"Arial";
    barCodeData.barColor            = @"Black";
    barCodeData.bgColor             = @"White";
    barCodeData.fontSize            = @10.0;
    barCodeData.barcodeOption       = BarcodeOption_BOTH;
    barCodeData.barcodeType         = BarcodeType_CODE_2_5_MATRIX;
    barCodeData.checkSumMethod      = CheckSumMethod_NONE;
    barCodeData.showTextPosition    = ShowTextPosition_BOTTOM_CENTER;
    barCodeData.barCodeImageFormat  = ImageFormats_PNG;
    
    GenerateBarCode *request = [[GenerateBarCode alloc] init];
    request.barCodeParam = barCodeData;
    request.barCodeText = self.dataToEncode.text;
    
    // make API call with callback registration
    [client generateBarCode:request success:^(GenerateBarCodeResponse *responseObject) {
        [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden = YES;
        
        // handle success
        UIImage *barcodeImage = [UIImage imageWithData:[responseObject generateBarCodeResult]];
        self.barcodeImage.image = barcodeImage;
        
    } failure:^(NSError *error, id<PicoBindable> soapFault) {
        [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden = YES;
        
        // error handling logic
        if (error) { // http or parsing error
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Error" message:error.localizedDescription delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        } else if (soapFault) { // soap fault
            SOAP11Fault *soap11Fault = (SOAP11Fault *)soapFault;
            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"SOAP Fault" message:soap11Fault.faultstring delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }];
    
}


@end
