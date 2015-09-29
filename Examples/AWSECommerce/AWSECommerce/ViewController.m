//
//  ViewController.m
//  AWSECommerce
//
//  Created by bulldog on 13-3-21.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "AWSECommerceServiceClient.h"
#import "CommonTypes.h"
#import "UIView+Toast.h"
#import "SOAP11Fault.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchText;

@end

@implementation ViewController

- (IBAction)search:(id)sender {
    // Hide the keyboard.
    [self.searchText resignFirstResponder];
    
    if (self.searchText.text.length > 0) {
        
        // start progress activity
        [self.view makeToastActivity];
        
        // get shared client
        AWSECommerceServiceClient *client = [AWSECommerceServiceClient sharedClient];
        client.debug = YES;
        
        // build request, see details here:
        ItemSearch *request = [[ItemSearch alloc] init];
        request.associateTag = @"tag"; // seems any tag is ok
        request.shared = [[ItemSearchRequest alloc] init];
        request.shared.searchIndex = @"Books";
        request.shared.responseGroup = [NSMutableArray arrayWithObjects:@"Images", @"Small", nil];
        ItemSearchRequest *itemSearchRequest = [[ItemSearchRequest alloc] init];
        itemSearchRequest.title = self.searchText.text;
        request.request = [NSMutableArray arrayWithObject:itemSearchRequest];
        
        // authenticate the request
        // http://docs.aws.amazon.com/AWSECommerceService/latest/DG/NotUsingWSSecurity.html
        [client authenticateRequest:@"ItemSearch"];
        [client itemSearch:request success:^(ItemSearchResponse *responseObject) {
            // stop progress activity
            [self.view hideToastActivity];
            
            // success handling logic
            if (responseObject.items.count > 0) {
                Items *items = [responseObject.items objectAtIndex:0];
                if (items.item.count > 0) {
                    Item *item = [items.item objectAtIndex:0];
                    
                    // start image downloading progress activity
                    [self.view makeToastActivity];
                    // get gallery image
                    NSURL *imageURL = [NSURL URLWithString:item.smallImage.url];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    // stop progress activity
                    [self.view hideToastActivity];
                    
                    UIImage *image = [UIImage imageWithData:imageData];
                    [self.view makeToast:item.itemAttributes.title duration:3.0 position:@"center" title:@"Success" image:image];
                } else {
                    // no result
                    [self.view makeToast:@"No result" duration:3.0 position:@"center"];
                }
                
            } else {
                // no result
                [self.view makeToast:@"No result" duration:3.0 position:@"center"];
            }
            // TODO
        } failure:^(NSError *error, id<PicoBindable> soapFault) {
            // stop progress activity
            [self.view hideToastActivity];
            
            // error handling logic
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
