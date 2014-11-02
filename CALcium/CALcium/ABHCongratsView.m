//
//  ABHCongratsView.m
//  CALcium
//
//  Created by Melissa Huang on 11/2/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import "ABHCongratsView.h"
#import "Masonry.h"

@interface ABHCongratsView ()

@property (nonatomic) UIImageView *bgView;
@property (nonatomic) UILabel *congrats;
@property (nonatomic) UILabel *reached;
@property (nonatomic) UILabel *message;

@end

@implementation ABHCongratsView

- (id)init {
    if (self) {
        self = [super init];
        [self createSubviews];
    }
    self.bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"party.png"]];
    
    [self addSubview:self.bgView];
    [self sendSubviewToBack:self.bgView];
    
    [self setNeedsUpdateConstraints];
    
    return self;
}

- (void)createSubviews {
    _congrats = [[UILabel alloc] init];
    _congrats.text = @"Congrats!";
    _congrats.font = [UIFont fontWithName:@"Helvetica" size:40];
    _congrats.textColor = [UIColor whiteColor];
    [self addSubview:_congrats];
    
    _reached = [[UILabel alloc] init];
    _reached.text = @"You reached your RDA of calcium";
    _reached.numberOfLines = 0;
    _reached.lineBreakMode = NSLineBreakByWordWrapping;
    _reached.font = [UIFont fontWithName:@"Helvetica" size:30];
    _reached.textColor = [UIColor whiteColor];
    [self addSubview:_reached];
    
    _message = [[UILabel alloc] init];
    _message.numberOfLines = 0;
    _message.lineBreakMode = NSLineBreakByWordWrapping;
    _message.text = @"Don't worry though, you can't exceed your daily calcium intake from food. Your body is smart enough to process it. Keep munchin'!";
    _message.font = [UIFont fontWithName:@"Helvetica" size:12];
    _message.textColor = [UIColor whiteColor];
    [self addSubview:_message];

}

- (void)updateConstraints {
    [_congrats mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@74);
        make.centerX.equalTo(@0);
    }];
    
    [_reached mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.congrats.mas_bottom).with.offset(20);
        make.centerX.equalTo(@0);
    }];
    
    [_message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_reached.mas_bottom).with.offset(30);
        make.centerX.equalTo(@0);
        make.width.equalTo(@300);
    }];
    
    [super updateConstraints];
}


@end
