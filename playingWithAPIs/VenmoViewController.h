//
//  VenmoViewController.h
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/12/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenmoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *toTextField;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;

@property (weak, nonatomic) IBOutlet UIImageView *toTextFieldTopBorder;
@property (weak, nonatomic) IBOutlet UIImageView *toTextFieldBottomBorder;
@property (weak, nonatomic) IBOutlet UISegmentedControl *venmoSegmentedControl;
@property (weak, nonatomic) IBOutlet UIImageView *venmoLogo;
@property (weak, nonatomic) IBOutlet UIButton *venmoPaymentButton;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (weak, nonatomic) IBOutlet UILabel *noteTextViewPlaceholderLabel;
@property (strong, nonatomic) NSString *transactionType;



@end
