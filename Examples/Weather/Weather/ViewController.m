//
//  ViewController.m
//  Weather
//
//  Created by bulldog on 13-3-20.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "WeatherServiceClient.h"
#import "CommonTypes.h"
#import "SOAP11Fault.h"

#import "UIView+Toast.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *queryText;
@property (weak, nonatomic) IBOutlet UITextView *queryResults;
@end

@implementation ViewController

- (IBAction)query:(id)sender {
    // Hide the keyboard.
    [self.queryText resignFirstResponder];
    
    // validate input
    if (!self.queryText.text.length) {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Invalid Parameters" message:@"Please enter valid zip to query and try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    // start progress activity
    [self.view makeToastActivity];
    
    WeatherServiceClient *client = [WeatherServiceClient sharedClient];
    client.debug = YES; // enable message logging
    
    // build reqeust
    GetCityWeatherByZIP *request = [[GetCityWeatherByZIP alloc] init];
    request.zip = self.queryText.text;
    
    // make API call with registered callbacks
    [client getCityWeatherByZIP:request success:^(GetCityWeatherByZIPResponse *responseObject) {
        // stop progress activity
        [self.view hideToastActivity];
        
        WeatherReturn *weatherReturn = responseObject.getCityWeatherByZIPResult;
        
        // success handling logic
        if (weatherReturn.success.boolValue == YES) {
            
            NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
            resultDict[@"City"] = weatherReturn.weatherStationCity;
            resultDict[@"Conditions"] = weatherReturn.description;
            resultDict[@"Temperature"] = weatherReturn.temperature;
            resultDict[@"RelativeHumidity"] = weatherReturn.relativeHumidity;
            resultDict[@"Wind"] = weatherReturn.wind;
            
            // show result
            self.queryResults.text = [resultDict description];
            
        } else {
            // response resident error
            [self.view makeToast:weatherReturn.responseText duration:3.0 position:@"center" title:@"Failure"];
        }
        
    } failure:^(NSError *error, id<PicoBindable> soapFault) {
        
        // stop progress activity
        [self.view hideToastActivity];
        
        // error handling logic
        if (error) { // http or parsing error
            [self.view makeToast:[error localizedDescription] duration:3.0 position:@"center" title:@"Error"];
        } else if (soapFault) { // soap fault
            SOAP11Fault *soap11Fault = (SOAP11Fault *)soapFault;
            [self.view makeToast:soap11Fault.faultstring duration:3.0 position:@"center" title:@"SOAP Fault"];
        }
        
    }];
}

@end
