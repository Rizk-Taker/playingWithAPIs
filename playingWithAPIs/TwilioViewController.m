//
//  TwilioViewController.m
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/11/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import "TwilioViewController.h"
#import "TwilioClient.h"

@interface TwilioViewController ()
{
    TCDevice* _phone;
    TCConnection* _connection;
}

@end

@implementation TwilioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hangupButton.hidden = YES;
    self.callButton.hidden = NO;
    
    [self.view removeConstraints:self.view.constraints];
    [self.callButton removeConstraints:self.callButton.constraints];
    [self.hangupButton removeConstraints:self.hangupButton.constraints];
    [self.numberField removeConstraints:self.numberField.constraints];
    
    self.callButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.hangupButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.numberField.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *numberFieldTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.numberField
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:40];
    
    [self.view addConstraint:numberFieldTopConstraint];
    
//    NSLayoutConstraint *APILogoBottomConstraint =
//    [NSLayoutConstraint constraintWithItem:self.APILogo
//                                 attribute:NSLayoutAttributeBottom
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.contentView
//                                 attribute:NSLayoutAttributeBottom
//                                multiplier:1.0
//                                  constant:-10];
//    
//    [self.contentView addConstraint:APILogoBottomConstraint];
    
    NSLayoutConstraint *numberFieldWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.numberField
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.80
                                  constant:0];
    
    [self.view addConstraint:numberFieldWidthConstraint];
    
    NSLayoutConstraint *numberFieldHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.numberField
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:.08
                                  constant:0];
    
    [self.view addConstraint:numberFieldHeightConstraint];
    
    NSLayoutConstraint *numberFieldCenteringXConstraint =
    [NSLayoutConstraint constraintWithItem:self.numberField
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:numberFieldCenteringXConstraint];
    
    NSLayoutConstraint *callButtonTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.callButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.numberField
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:25];
    
    [self.view addConstraint:callButtonTopConstraint];
    
    NSLayoutConstraint *callButtonWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.callButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.30
                                  constant:0];
    
    [self.view addConstraint:callButtonWidthConstraint];
    
    NSLayoutConstraint *callButtonHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.callButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:.15
                                  constant:0];
    
    [self.view addConstraint:callButtonHeightConstraint];
    
    NSLayoutConstraint *callButtonCenteringXConstraint =
    [NSLayoutConstraint constraintWithItem:self.callButton
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:callButtonCenteringXConstraint];
    
    NSLayoutConstraint *hangupButtonTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.hangupButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.numberField
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:25];
    
    [self.view addConstraint:hangupButtonTopConstraint];
    
    NSLayoutConstraint *hangupButtonWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.hangupButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.30
                                  constant:0];
    
    [self.view addConstraint:hangupButtonWidthConstraint];
    
    NSLayoutConstraint *hangupButtonHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.hangupButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:.15
                                  constant:0];
    
    [self.view addConstraint:hangupButtonHeightConstraint];
    
    NSLayoutConstraint *hangupButtonCenteringXConstraint =
    [NSLayoutConstraint constraintWithItem:self.hangupButton
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:hangupButtonCenteringXConstraint];

    NSURL *url = [NSURL URLWithString:@"http://blooming-castle-9501.herokuapp.com"];
    NSError *error = nil;
    NSString *token = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (token == nil) {
        NSLog(@"Error retrieving token: %@", [error localizedDescription]);
    } else {
        _phone = [[TCDevice alloc] initWithCapabilityToken:token delegate:nil];
    }
    // Do any additional setup after loading the view.
}

-(void)connect:(NSDictionary*)parameters delegate: (id<TCDeviceDelegate>)delegate{
    
    
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

- (IBAction)callButtonTapped:(id)sender {
    
    self.callButton.hidden = YES;
    self.hangupButton.hidden = NO;
    NSDictionary *params = @{@"To": self.numberField.text};
    _connection = [_phone connect:params delegate:nil];
    
}

- (IBAction)hangupButtonTapped:(id)sender {

    self.callButton.hidden = NO;
    self.hangupButton.hidden = YES;
    [_connection disconnect];
}
@end
