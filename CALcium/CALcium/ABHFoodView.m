//
//  ABHFoodView.m
//  CALcium
//
//  Created by Melissa Huang on 11/1/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import "ABHFoodView.h"
#import "Masonry.h"

@interface ABHFoodView ()


@end

@implementation ABHFoodView

- (id)initWithDelegate:(id<UITextFieldDelegate>)delegate {
    if (self) {
        self = [super init];
        [self createSubviews];
    }
    self.alphaView = [[UIView alloc] init];
    self.alphaView.backgroundColor = [UIColor blackColor];
    self.alphaView.alpha = 0.3;
    [self addSubview:self.alphaView];
    [self sendSubviewToBack:self.alphaView];

    
    self.bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"city_background.png"]];
    [self addSubview:_bgView];
    [self sendSubviewToBack:_bgView];

    self.delegate = delegate;
    self.messageLabel.delegate = delegate;
    self.searchTextField.delegate = delegate;
    [self setNeedsUpdateConstraints];

    return self;
}

- (void)createSubviews {
    
    _messageLabel = [[UITextField alloc] init];
    _messageLabel.textColor = [UIColor blackColor];
    _messageLabel.text = @"message label";
    [self addSubview:_messageLabel];
    
    _recordButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_recordButton setBackgroundImage:[UIImage imageNamed:@"siri.png"] forState:UIControlStateNormal];
//    [_recordButton setBackgroundImage:[UIImage imageNamed:@"siri.png"] forState:UICon];
    [_recordButton addTarget:self.delegate action:@selector(recordButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_recordButton];
    
    _searchTextField = [[UITextField alloc] init];
    _searchTextField.text = @"search";
    _searchTextField.textColor = [UIColor whiteColor];
    [self addSubview:_searchTextField];
    
    _progressBar = [[YLProgressBar alloc] init];
    _progressBar.type                     = YLProgressBarTypeFlat;
    _progressBar.hideGloss                = NO;
    _progressBar.hideStripes              = NO;
    _progressBar.layer.cornerRadius = 10;
    _progressBar.indicatorTextDisplayMode = YLProgressBarIndicatorTextDisplayModeProgress;
    _progressBar.progressTintColors       = @[[UIColor colorWithRed:33/255.0f green:180/255.0f blue:162/255.0f alpha:1.0f],
                                              [UIColor colorWithRed:3/255.0f green:137/255.0f blue:166/255.0f alpha:1.0f],
                                              [UIColor colorWithRed:91/255.0f green:63/255.0f blue:150/255.0f alpha:1.0f],
                                              [UIColor colorWithRed:87/255.0f green:26/255.0f blue:70/255.0f alpha:1.0f],
                                              [UIColor colorWithRed:126/255.0f green:26/255.0f blue:36/255.0f alpha:1.0f],
                                              [UIColor colorWithRed:149/255.0f green:37/255.0f blue:36/255.0f alpha:1.0f],
                                              [UIColor colorWithRed:228/255.0f green:69/255.0f blue:39/255.0f alpha:1.0f],
                                              [UIColor colorWithRed:245/255.0f green:166/255.0f blue:35/255.0f alpha:1.0f],
                                              [UIColor colorWithRed:165/255.0f green:202/255.0f blue:60/255.0f alpha:1.0f],
                                              [UIColor colorWithRed:202/255.0f green:217/255.0f blue:54/255.0f alpha:1.0f],
                                              [UIColor colorWithRed:111/255.0f green:188/255.0f blue:84/255.0f alpha:1.0f]];
    
    _progressBar.progress = 0.2f;
    
    [self addSubview:_progressBar];
}


- (void)updateConstraints {
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
        make.left.equalTo(@0);
    }];
    [_alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
        make.left.equalTo(@0);
    }];
    
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@60);
        make.centerX.equalTo(@0);
    }];
    
    [_recordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageLabel.mas_bottom).with.offset(20);
        make.centerX.equalTo(@0);
        make.width.equalTo(@150);
        make.height.equalTo(@150);
    }];
    
    [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.recordButton.mas_bottom).with.offset(20);
        make.centerX.equalTo(@0);
    }];
    
    [_progressBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-40);
        make.centerX.equalTo(@0);
        make.width.equalTo(@300);
        make.height.equalTo(@20);
    }];
    _progressBar.layer.cornerRadius = 10;

    [super updateConstraints];
}

@end
