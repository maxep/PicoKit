//
//  ViewController.m
//  CurrencyConverter
//
//  Created by bulldog on 13-3-19.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyConverterSerivceClient.h"
#import "Currency.h"
#import "SOAP11Fault.h"


@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *fromValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *fromCurrencyTextField;
@property (weak, nonatomic) IBOutlet UITextField *toCurrencyTextField;
@property (weak, nonatomic) IBOutlet UITextField *toValueTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, readonly) NSArray *currencies;
@end

@implementation ViewController

@synthesize currencies = _currencies;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.activityIndicator.hidden = YES;
    
    UIPickerView *fromCurrencyPicker = [[UIPickerView alloc] init];
    fromCurrencyPicker.dataSource = self;
    fromCurrencyPicker.delegate = self;
    fromCurrencyPicker.showsSelectionIndicator = YES;
    self.fromCurrencyTextField.inputView = fromCurrencyPicker;
    self.fromCurrencyTextField.tintColor = [UIColor whiteColor];
    
    UIPickerView *toCurrencyPicker = [[UIPickerView alloc] init];
    toCurrencyPicker.dataSource = self;
    toCurrencyPicker.delegate = self;
    toCurrencyPicker.showsSelectionIndicator = YES;
    self.toCurrencyTextField.inputView = toCurrencyPicker;
    self.toCurrencyTextField.tintColor = [UIColor whiteColor];
}

#pragma mark - UI Event Handlers

- (IBAction)onConvertClicked:(id)sender {
    [self.fromValueTextField resignFirstResponder];
    
    if (!self.fromCurrencyTextField.text.length || !self.toCurrencyTextField.text.length)
    {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Invalid Parameters" message:@"Please enter valid from and to currency types and try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    if (!self.fromValueTextField.text.length) {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Invalid Parameters" message:@"Please enter valid value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    
    // Get shared client
    CurrencyConverterSerivceClient *client = [CurrencyConverterSerivceClient sharedClient];
    client.debug = YES; // enable message logging
    client.timeoutInverval = 10; // http timeout in seconds
    
    // build request
    ConversionRate *request = [[ConversionRate alloc] init];
    request.fromCurrency = self.fromCurrencyTextField.text;
    request.toCurrency = self.toCurrencyTextField.text;
    
    // make API call
    [client conversionRate:request success:^(ConversionRateResponse *responseObject) {
        
        // success handling logic
        [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden = YES;
        CGFloat from = [self.fromValueTextField.text floatValue];
        CGFloat rate = [responseObject.conversionRateResult floatValue];
        
        self.toValueTextField.text = [NSString stringWithFormat: @"%.2f", from * rate];
        
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

#pragma mark <UIPickerViewDataSource>

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.currencies.count;
}

#pragma mark <UIPickerViewDelegate>

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.currencies[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == self.fromCurrencyTextField.inputView) {
        self.fromCurrencyTextField.text = self.currencies[row];
    } else if (pickerView == self.toCurrencyTextField.inputView) {
        self.toCurrencyTextField.text = self.currencies[row];
    }
}

- (NSArray *)currencies {
    if (!_currencies) {
        _currencies = @[   Currency_AFA,
                           Currency_ALL,
                           Currency_DZD,
                           Currency_ARS,
                           Currency_AWG,
                           Currency_AUD,
                           Currency_BSD,
                           Currency_BHD,
                           Currency_BDT,
                           Currency_BBD,
                           Currency_BZD,
                           Currency_BMD,
                           Currency_BTN,
                           Currency_BOB,
                           Currency_BWP,
                           Currency_BRL,
                           Currency_GBP,
                           Currency_BND,
                           Currency_BIF,
                           Currency_XOF,
                           Currency_XAF,
                           Currency_KHR,
                           Currency_CAD,
                           Currency_CVE,
                           Currency_KYD,
                           Currency_CLP,
                           Currency_CNY,
                           Currency_COP,
                           Currency_KMF,
                           Currency_CRC,
                           Currency_HRK,
                           Currency_CUP,
                           Currency_CYP,
                           Currency_CZK,
                           Currency_DKK,
                           Currency_DJF,
                           Currency_DOP,
                           Currency_XCD,
                           Currency_EGP,
                           Currency_SVC,
                           Currency_EEK,
                           Currency_ETB,
                           Currency_EUR,
                           Currency_FKP,
                           Currency_GMD,
                           Currency_GHC,
                           Currency_GIP,
                           Currency_XAU,
                           Currency_GTQ,
                           Currency_GNF,
                           Currency_GYD,
                           Currency_HTG,
                           Currency_HNL,
                           Currency_HKD,
                           Currency_HUF,
                           Currency_ISK,
                           Currency_INR,
                           Currency_IDR,
                           Currency_IQD,
                           Currency_ILS,
                           Currency_JMD,
                           Currency_JPY,
                           Currency_JOD,
                           Currency_KZT,
                           Currency_KES,
                           Currency_KRW,
                           Currency_KWD,
                           Currency_LAK,
                           Currency_LVL,
                           Currency_LBP,
                           Currency_LSL,
                           Currency_LRD,
                           Currency_LYD,
                           Currency_LTL,
                           Currency_MOP,
                           Currency_MKD,
                           Currency_MGF,
                           Currency_MWK,
                           Currency_MYR,
                           Currency_MVR,
                           Currency_MTL,
                           Currency_MRO,
                           Currency_MUR,
                           Currency_MXN,
                           Currency_MDL,
                           Currency_MNT,
                           Currency_MAD,
                           Currency_MZM,
                           Currency_MMK,
                           Currency_NAD,
                           Currency_NPR,
                           Currency_ANG,
                           Currency_NZD,
                           Currency_NIO,
                           Currency_NGN,
                           Currency_KPW,
                           Currency_NOK,
                           Currency_OMR,
                           Currency_XPF,
                           Currency_PKR,
                           Currency_XPD,
                           Currency_PAB,
                           Currency_PGK,
                           Currency_PYG,
                           Currency_PEN,
                           Currency_PHP,
                           Currency_XPT,
                           Currency_PLN,
                           Currency_QAR,
                           Currency_ROL,
                           Currency_RUB,
                           Currency_WST,
                           Currency_STD,
                           Currency_SAR,
                           Currency_SCR,
                           Currency_SLL,
                           Currency_XAG,
                           Currency_SGD,
                           Currency_SKK,
                           Currency_SIT,
                           Currency_SBD,
                           Currency_SOS,
                           Currency_ZAR,
                           Currency_LKR,
                           Currency_SHP,
                           Currency_SDD,
                           Currency_SRG,
                           Currency_SZL,
                           Currency_SEK,
                           Currency_CHF,
                           Currency_SYP,
                           Currency_TWD,
                           Currency_TZS,
                           Currency_THB,
                           Currency_TOP,
                           Currency_TTD,
                           Currency_TND,
                           Currency_TRL,
                           Currency_USD,
                           Currency_AED,
                           Currency_UGX,
                           Currency_UAH,
                           Currency_UYU,
                           Currency_VUV,
                           Currency_VEB,
                           Currency_VND,
                           Currency_YER,
                           Currency_YUM,
                           Currency_ZMK,
                           Currency_ZWD,
                           Currency_TRY,
                           ];
    }
    return _currencies;
}

@end
