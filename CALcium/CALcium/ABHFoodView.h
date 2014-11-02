//
//  ABHFoodView.h
//  CALcium
//
//  Created by Melissa Huang on 11/1/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLProgressBar.h"
#import "ABHFoodViewDelegate.h"

@interface ABHFoodView : UIView

@property (nonatomic) UITextField *messageLabel;
@property (nonatomic) id<ABHFoodViewDelegate> delegate;
@property (nonatomic) UIButton *recordButton;
@property (nonatomic) UITextField *searchTextField;
@property (nonatomic) UIImageView *bgView;
@property (nonatomic) UIView *alphaView;
@property (nonatomic) YLProgressBar *progressBar;
@property (nonatomic) UILabel *totalRDA;

- (id)initWithDelegate:(id<UITextFieldDelegate>)delegate;

@end
