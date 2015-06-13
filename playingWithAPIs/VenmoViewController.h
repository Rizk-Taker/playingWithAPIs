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
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendPaymentButton;
- (IBAction)sendPaymentButtonTapped:(id)sender;



@end
