//
//  VenmoViewController.m
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/12/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import "VenmoViewController.h"
#import <Venmo-iOS-SDK/Venmo.h>

@interface VenmoViewController ()

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
    
    [self.view removeConstraints:self.view.constraints];
    [self.toTextField removeConstraints:self.toTextField.constraints];
    [self.amountTextField removeConstraints:self.amountTextField.constraints];
    [self.noteTextField removeConstraints:self.noteTextField.constraints];
    [self.sendPaymentButton removeConstraints:self.sendPaymentButton.constraints];
    
    self.toTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.amountTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.noteTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.sendPaymentButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *toTextFieldTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextField
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:70];
    
    [self.view addConstraint:toTextFieldTopConstraint];
    
    NSLayoutConstraint *toTextFieldWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextField
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.70
                                  constant:0];
    
    [self.view addConstraint:toTextFieldWidthConstraint];
    
    NSLayoutConstraint *toTextFieldCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.toTextField
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:toTextFieldCenterXConstraint];
    
    NSLayoutConstraint *amountTextFieldTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.amountTextField
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.toTextField
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:10];
    
    [self.view addConstraint:amountTextFieldTopConstraint];
    
    NSLayoutConstraint *amountTextFieldWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.amountTextField
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.70
                                  constant:0];
    
    [self.view addConstraint:amountTextFieldWidthConstraint];
    
    NSLayoutConstraint *amountTextFieldCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.amountTextField
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:amountTextFieldCenterXConstraint];
    
    NSLayoutConstraint *noteTextFieldTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.noteTextField
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.amountTextField
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:10];
    
    [self.view addConstraint:noteTextFieldTopConstraint];
    
    NSLayoutConstraint *noteTextFieldWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.noteTextField
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.70
                                  constant:0];
    
    [self.view addConstraint:noteTextFieldWidthConstraint];
    
    NSLayoutConstraint *noteTextFieldCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.noteTextField
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:noteTextFieldCenterXConstraint];
    
    NSLayoutConstraint *sendPaymentButtonTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.sendPaymentButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.noteTextField
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:10];
    
    [self.view addConstraint:sendPaymentButtonTopConstraint];
    
    NSLayoutConstraint *sendPaymentButtonWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.sendPaymentButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.25
                                  constant:0];
    
    [self.view addConstraint:sendPaymentButtonWidthConstraint];
    
    NSLayoutConstraint *sendPaymentButtonCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.sendPaymentButton
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:sendPaymentButtonCenterXConstraint];
    
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendPaymentButtonTapped:(id)sender {
    
    [[Venmo sharedInstance] sendPaymentTo:self.toTextField.text
                                   amount:self.amountTextField.text.floatValue*100 // this is in cents!
                                     note:self.noteTextField.text
                        completionHandler:^(VENTransaction *transaction, BOOL success, NSError *error) {
                            if (success) {
                                NSLog(@"Transaction succeeded!");
                            }
                            else {
                                NSLog(@"Transaction failed with error: %@", [error localizedDescription]);
                            }
                        }];

}


@end
