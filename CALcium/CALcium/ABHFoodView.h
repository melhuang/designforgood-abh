//
//  ABHFoodView.h
//  CALcium
//
//  Created by Melissa Huang on 11/1/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLProgressBar.h"

@interface ABHFoodView : UIView

@property (nonatomic) UITextField *messageLabel;
@property (nonatomic) id delegate;
@property (nonatomic) UIButton *recordButton;
@property (nonatomic) UITextField *searchTextField;
@property (nonatomic) UIImageView *bgView;
@property (nonatomic) YLProgressBar *progressBar;

- (id)initWithDelegate:(id<UITextFieldDelegate>)delegate;

@end
