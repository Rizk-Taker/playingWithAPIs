//
//  APIHomeScreenTableViewCell.m
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/7/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import "APIHomeScreenTableViewCell.h"

@implementation APIHomeScreenTableViewCell

- (void)awakeFromNib {
    
    // Initialization code
    [self.contentView removeConstraints:self.contentView.constraints];
    [self.APILogo removeConstraints:self.APILogo.constraints];
    
    self.APILogo.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *APILogoTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.APILogo
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:10];
    
    [self.contentView addConstraint:APILogoTopConstraint];
    
    NSLayoutConstraint *APILogoBottomConstraint =
    [NSLayoutConstraint constraintWithItem:self.APILogo
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:-10];
    
    [self.contentView addConstraint:APILogoBottomConstraint];
    
//    NSLayoutConstraint *APILogoLeftConstraint =
//    [NSLayoutConstraint constraintWithItem:self.APILogo
//                                 attribute:NSLayoutAttributeLeft
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.contentView
//                                 attribute:NSLayoutAttributeLeft
//                                multiplier:1.0
//                                  constant:100];
//    
//    [self.contentView addConstraint:APILogoLeftConstraint];
//    
//    NSLayoutConstraint *APILogoRightConstraint =
//    [NSLayoutConstraint constraintWithItem:self.APILogo
//                                 attribute:NSLayoutAttributeRight
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.contentView
//                                 attribute:NSLayoutAttributeRight
//                                multiplier:1.0
//                                  constant:-50];
//    
//    [self.contentView addConstraint:APILogoRightConstraint];
    
    NSLayoutConstraint *APILogoWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.APILogo
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.30
                                  constant:0];
    
    [self.contentView addConstraint:APILogoWidthConstraint];
    
    NSLayoutConstraint *APILogoHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.APILogo
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeHeight
                                multiplier:.80
                                  constant:0];
    
    [self.contentView addConstraint:APILogoHeightConstraint];
    
    NSLayoutConstraint *APILogoCenteringXConstraint =
    [NSLayoutConstraint constraintWithItem:self.APILogo
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.contentView
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.contentView addConstraint:APILogoCenteringXConstraint];
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
