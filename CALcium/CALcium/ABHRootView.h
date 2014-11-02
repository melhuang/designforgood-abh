//
//  ABHRootView.h
//  CALcium
//
//  Created by Melissa Huang on 11/1/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABHRootView : UIView

@property (nonatomic) int RDA;
@property (nonatomic) UIViewController *parent;

- (void)setRDAWithButton:(id)sender;

@end
