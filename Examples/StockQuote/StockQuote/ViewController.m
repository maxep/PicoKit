//
//  ViewController.m
//  StockQuote
//
//  Created by bulldog on 13-3-19.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "StockQuoteServiceClient.h"
#import "CommonTypes.h"
#import "SOAP11Fault.h"

#import "UIView+Toast.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *symbolText;
@property (weak, nonatomic) IBOutlet UITextView *resultText;
@end

@implementation ViewController

- (IBAction)getQuote:(id)sender {
    // Hide the keyboard.
    [self.symbolText resignFirstResponder];
    
    if (self.symbolText.text.length > 0) {
        
        // start progress activity
        [self.view makeToastActivity];
        
        // Get shared service client
        StockQuoteServiceClient *client = [StockQuoteServiceClient sharedClient];
        client.debug = YES; // enable request/response message logging
        
        // Build request object
        GetQuote *request = [[GetQuote alloc] init];
        request.symbol = self.symbolText.text;
        
        // make API call and register callbacks
        [client getQuote:request success:^(GetQuoteResponse *responseObject) {
            
            // stop progress activity
            [self.view hideToastActivity];
            
            // show result
            self.resultText.text = responseObject.getQuoteResult;
        } failure:^(NSError *error, id<PicoBindable> soapFault) {
            
            // stop progress activity
            [self.view hideToastActivity];
            
            if (error) { // http or parsing error
                [self.view makeToast:[error localizedDescription] duration:3.0 position:@"center" title:@"Error"];
            } else if (soapFault) {
                SOAP11Fault *soap11Fault = (SOAP11Fault *)soapFault;
                [self.view makeToast:soap11Fault.faultstring duration:3.0 position:@"center" title:@"SOAP Fault"];
            }
        }];
        
    }
}

@end
