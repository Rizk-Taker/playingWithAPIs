//
//  TwilioViewController.h
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/11/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwilioViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UIButton *hangupButton;
@property (weak, nonatomic) IBOutlet UITextField *numberField;

- (IBAction)callButtonTapped:(id)sender;
- (IBAction)hangupButtonTapped:(id)sender;


@end
