//
//  VenmoViewController.m
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/12/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import "VenmoViewController.h"
#import <Venmo-iOS-SDK/Venmo.h>
#import "UITextView+Placeholder.h"

@interface VenmoViewController () <UITextViewDelegate,UITextFieldDelegate>
- (IBAction)venmoPaymentButtonTapped:(id)sender;

@end

@implementation VenmoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAPI];
    
    if (![Venmo isVenmoAppInstalled]) {
        [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAPI];
    }
    else {
        [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAPI];
    }
    
    [[Venmo sharedInstance] requestPermissions:@[VENPermissionMakePayments,
                                                 VENPermissionAccessProfile]
                         withCompletionHandler:^(BOOL success, NSError *error) {
                             if (success) {
                                 // :)
                             }
                             else {
                                 // :(
                             }
                         }];
//
    [self.view removeConstraints:self.view.constraints];
    [self.toTextField removeConstraints:self.toTextField.constraints];
    [self.amountTextField removeConstraints:self.amountTextField.constraints];
    [self.noteTextView removeConstraints:self.noteTextView.constraints];
    [self.toTextFieldTopBorder removeConstraints:self.toTextFieldTopBorder.constraints];
    [self.toTextFieldBottomBorder removeConstraints:self.toTextFieldBottomBorder.constraints];
    [self.venmoSegmentedControl removeConstraints:self.venmoSegmentedControl.constraints];
    [self.venmoLogo removeConstraints:self.venmoLogo.constraints];
    [self.venmoPaymentButton removeConstraints:self.venmoPaymentButton.constraints];
    [self.noteTextViewPlaceholderLabel removeConstraints:self.venmoPaymentButton.constraints];
    
    self.toTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.amountTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.noteTextView.translatesAutoresizingMaskIntoConstraints = NO;
    self.toTextFieldTopBorder.translatesAutoresizingMaskIntoConstraints = NO;
    self.toTextFieldBottomBorder.translatesAutoresizingMaskIntoConstraints = NO;
    self.venmoSegmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
    self.venmoLogo.translatesAutoresizingMaskIntoConstraints = NO;
    self.venmoPaymentButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.noteTextViewPlaceholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.noteTextViewPlaceholderLabel.hidden =YES;
    self.noteTextView.placeholder = @"what's it for?";

    
    NSLayoutConstraint *toTextFieldTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextField
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.toTextFieldTopBorder
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:12];
    
    [self.view addConstraint:toTextFieldTopConstraint];
    
    NSLayoutConstraint *toTextFieldWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextField
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.80
                                  constant:0];
    
    [self.view addConstraint:toTextFieldWidthConstraint];
    
    NSLayoutConstraint *toTextFieldLeftConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextField
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:4];
    
    [self.view addConstraint:toTextFieldLeftConstraint];
    
    NSLayoutConstraint *amountTextFieldTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.amountTextField
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.toTextField
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:amountTextFieldTopConstraint];
    
    NSLayoutConstraint *amountTextFieldHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.amountTextField
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.toTextField
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:amountTextFieldHeightConstraint];
    
    NSLayoutConstraint *amountTextFieldRightConstraint =
    [NSLayoutConstraint constraintWithItem:self.amountTextField
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:amountTextFieldRightConstraint];
    
    NSLayoutConstraint *noteTextViewTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.noteTextView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.toTextFieldBottomBorder
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:6];
    
    [self.view addConstraint:noteTextViewTopConstraint];
    
    NSLayoutConstraint *noteTextViewLeftConstraint =
    [NSLayoutConstraint constraintWithItem:self.noteTextView
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:4];
    
    [self.view addConstraint:noteTextViewLeftConstraint];
    
    NSLayoutConstraint *noteTextViewRightConstraint =
    [NSLayoutConstraint constraintWithItem:self.noteTextView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:-4];
    
    [self.view addConstraint:noteTextViewRightConstraint];
    
    NSLayoutConstraint *noteTextViewBottomConstraint =
    [NSLayoutConstraint constraintWithItem:self.noteTextView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.venmoPaymentButton
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:-12];
    
    [self.view addConstraint:noteTextViewBottomConstraint];
    
    NSLayoutConstraint *toTextFieldTopBorderTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextFieldTopBorder
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.venmoSegmentedControl
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:20];
    
    [self.view addConstraint:toTextFieldTopBorderTopConstraint];
    
    NSLayoutConstraint *toTextFieldTopBorderWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextFieldTopBorder
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:toTextFieldTopBorderWidthConstraint];

    NSLayoutConstraint *toTextFieldTopBorderCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextFieldTopBorder
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:toTextFieldTopBorderCenterXConstraint];
    
    NSLayoutConstraint *toTextFieldBottomBorderTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextFieldBottomBorder
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.toTextField
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:12];
    
    [self.view addConstraint:toTextFieldBottomBorderTopConstraint];
    
    NSLayoutConstraint *toTextFieldBottomBorderWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextFieldBottomBorder
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:toTextFieldBottomBorderWidthConstraint];
    
    NSLayoutConstraint *toTextFieldBottomBorderCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextFieldBottomBorder
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:toTextFieldBottomBorderCenterXConstraint];
    
    NSLayoutConstraint *venmoSegmentedControlTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoSegmentedControl
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:30];
    
    [self.view addConstraint:venmoSegmentedControlTopConstraint];
    
    NSLayoutConstraint *venmoSegmentedControlWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoSegmentedControl
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.75
                                  constant:0];
    
    [self.view addConstraint:venmoSegmentedControlWidthConstraint];
    
    NSLayoutConstraint *venmoSegmentedControlCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoSegmentedControl
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:venmoSegmentedControlCenterXConstraint];
    
    NSLayoutConstraint *venmoLogoCenterYConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoLogo
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.venmoPaymentButton
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:venmoLogoCenterYConstraint];
    
    NSLayoutConstraint *venmoLogoCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoLogo
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.venmoPaymentButton
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:venmoLogoCenterXConstraint];
    
    NSLayoutConstraint *venmoLogoWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoLogo
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.30
                                  constant:0];
    
    [self.view addConstraint:venmoLogoWidthConstraint];
    
    NSLayoutConstraint *venmoLogoHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoLogo
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.venmoPaymentButton
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:venmoLogoHeightConstraint];
    
    NSLayoutConstraint *venmoPaymentButtonCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoPaymentButton
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:venmoPaymentButtonCenterXConstraint];
    
    NSLayoutConstraint *venmoPaymentButtonWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoPaymentButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:venmoPaymentButtonWidthConstraint];
    
    NSLayoutConstraint *venmoPaymentButtonHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoPaymentButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:.13
                                  constant:0];
    
    [self.view addConstraint:venmoPaymentButtonHeightConstraint];
    
    NSLayoutConstraint *venmoPaymentTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.venmoPaymentButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:280];
    
    [self.view addConstraint:venmoPaymentTopConstraint];
    
    NSLayoutConstraint *noteTextViewPlaceholderLabelTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.noteTextViewPlaceholderLabel
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.noteTextView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:noteTextViewPlaceholderLabelTopConstraint];
    
    NSLayoutConstraint *noteTextViewPlaceholderLabelLeftConstraint =
    [NSLayoutConstraint constraintWithItem:self.noteTextViewPlaceholderLabel
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.noteTextView
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:noteTextViewPlaceholderLabelLeftConstraint];
    
    self.noteTextViewPlaceholderLabel.text = @"what's it for?";
    self.noteTextViewPlaceholderLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:19];
    self.noteTextViewPlaceholderLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.098/255.0 alpha:0.22];

    [self.toTextField becomeFirstResponder];
    
    self.toTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.amountTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.noteTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    
    [self.venmoPaymentButton setBackgroundColor:[UIColor colorWithRed:86.0/255.0 green:152.0/255.0 blue:204.0/255.0 alpha:1.0]];
//
    [self.venmoSegmentedControl setTintColor:[UIColor colorWithRed:216.0/255.0 green:216.0/255.0 blue:216.0/255.0 alpha:1.0]];

    [self.venmoSegmentedControl setBackgroundColor:[UIColor whiteColor]];
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont fontWithName:@"Arial Rounded MT Bold" size:20], NSFontAttributeName,
                                nil];
    
    [self.venmoSegmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    [self.view bringSubviewToFront:self.venmoLogo];
    [self.view bringSubviewToFront:self.noteTextView];
    [self.noteTextView addSubview:self.noteTextViewPlaceholderLabel];
    
    [self.noteTextView setTextColor:[UIColor blackColor]];
     self.noteTextView.placeholderColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.098/255.0 alpha:0.22];
    
    self.toTextField.delegate = self;
    self.amountTextField.delegate = self;
    self.noteTextView.delegate = self;
    
    [self.noteTextView setReturnKeyType:UIReturnKeyDefault];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Specify a transaction type, recipient, amount, and note..."message:@"then tap the Venmo logo to send or request a payment." delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.toTextField) {
        [self.amountTextField becomeFirstResponder];
        return YES;
    }
    else if (textField == self.amountTextField) {
        [self.noteTextView becomeFirstResponder];
        return NO;
    }
    return true;
}

-(void)transactionAlerts {


}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSInteger maxLength = 20;
    
    if (textField == self.amountTextField) {
        maxLength = 5;
    }
    
    NSUInteger length = [textField.text length] + [string length] - range.length;
    return !(length > maxLength);
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self.noteTextView resignFirstResponder];
    NSLog(@"after resign");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendPaymentButtonTapped:(id)sender {
    
    [[Venmo sharedInstance] sendPaymentTo:self.toTextField.text
                                   amount:self.amountTextField.text.floatValue*100 // this is in cents!
                                     note:self.noteTextView.text
                        completionHandler:^(VENTransaction *transaction, BOOL success, NSError *error) {
                            if (success) {
                                NSLog(@"Transaction succeeded!");
                                    UIAlertView *paymentSentAlert = [[UIAlertView alloc]initWithTitle:@"Payment sent!"message:nil delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
                                    [paymentSentAlert show];
                            }
                            else {
                                NSLog(@"Transaction failed with error: %@", [error localizedDescription]);
                            }
                        }];

}


- (IBAction)venmoPaymentButtonTapped:(id)sender {
    if (self.venmoSegmentedControl.selectedSegmentIndex ==0) {
        [[Venmo sharedInstance] sendRequestTo:self.toTextField.text
                                       amount:self.amountTextField.text.floatValue*100 // this is in cents!
                                         note:self.noteTextView.text
                            completionHandler:^(VENTransaction *transaction, BOOL success, NSError *error) {
                                if (success) {
                                    NSLog(@"Payment request sent!");
                                    UIAlertView *paymentRequestSentAlert = [[UIAlertView alloc]initWithTitle:@"Payment request sent!"message:nil delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
                                    [paymentRequestSentAlert show];
                                }
                                else {
                                    NSLog(@"Transaction failed with error: %@", [error localizedDescription]);
                                    NSString *errorString = [error localizedDescription];
                                    UIAlertView *paymentRequestFailedAlert = [[UIAlertView alloc]initWithTitle:@"Transaction failed" message:errorString delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
                                    [paymentRequestFailedAlert show];
                                }
                            }];
    }
    
    else if (self.venmoSegmentedControl.selectedSegmentIndex ==1) {
        [[Venmo sharedInstance] sendPaymentTo:self.toTextField.text
                                       amount:self.amountTextField.text.floatValue*100 // this is in cents!
                                         note:self.noteTextView.text
                            completionHandler:^(VENTransaction *transaction, BOOL success, NSError *error) {
                                if (success) {
                                    NSLog(@"Payment sent!");
                                    UIAlertView *paymentSentAlert = [[UIAlertView alloc]initWithTitle:@"Payment request sent!"message:nil delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
                                    [paymentSentAlert show];
                                }
                                else {
                                    NSLog(@"Transaction failed with error: %@", [error localizedDescription]);
                                    NSString *errorString = [error localizedDescription];
                                    UIAlertView *paymentRequestFailedAlert = [[UIAlertView alloc]initWithTitle:@"Transaction failed" message:errorString delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
                                    [paymentRequestFailedAlert show];
                                }
                            }];

    }
}
@end
