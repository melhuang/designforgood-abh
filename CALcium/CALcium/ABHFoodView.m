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
        [self setNeedsUpdateConstraints];
    }
    self.backgroundColor = [UIColor whiteColor];
    self.delegate = delegate;
    self.messageLabel.delegate = delegate;
    self.searchTextField.delegate = delegate;
    return self;
}

- (void)createSubviews {
    
    self.backgroundColor = [UIColor whiteColor];
    
    _messageLabel = [[UITextField alloc] init];
    _messageLabel.textColor = [UIColor blackColor];
    _messageLabel.text = @"message label";
    [self addSubview:_messageLabel];
    
    _recordButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_recordButton setTitle:@"record button" forState:UIControlStateNormal];
    [_recordButton addTarget:self.delegate action:@selector(recordButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_recordButton];
    
    _searchTextField = [[UITextField alloc] init];
    _searchTextField.text = @"search";
    _searchTextField.textColor = [UIColor blackColor];
    _searchTextField.layer.borderColor = [[UIColor blackColor] CGColor];
    _searchTextField.layer.borderWidth = 1.0f;
    
    [self addSubview:_searchTextField];
}

- (void)updateConstraints {
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@60);
        make.centerX.equalTo(@0);
        make.width.equalTo(@200);
    }];
    
    [_recordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageLabel.mas_bottom).with.offset(20);
        make.centerX.equalTo(@0);
        make.width.equalTo(@200);
    }];
    
    [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.recordButton.mas_bottom).with.offset(20);
        make.centerX.equalTo(@0);
        make.left.equalTo(@10);
        make.width.equalTo(@300);
    }];
    
    [super updateConstraints];
}

@end
