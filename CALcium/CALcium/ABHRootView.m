//
//  ABHRootView.m
//  CALcium
//
//  Created by Melissa Huang on 11/1/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import "ABHRootView.h"
#import "Masonry.h"
#import "ABHFoodViewController.h"

@interface ABHRootView ()

@end

@implementation ABHRootView

UIImageView *abh;
UILabel *intro;
UILabel *pregnant;

UIButton *group1;
UIButton *group2;
UIButton *group3;
UIButton *group4;

UIButton *man;
UIButton *woman;
UIButton *old;


UIButton *group5;
UIButton *group6;

- (id)init {
    if (self) {
        self = [super init];
        [self createSubviews];
        [self setNeedsUpdateConstraints];
    }
    self.backgroundColor = [UIColor whiteColor];
    return self;
}

- (void)createSubviews {
    abh = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"abhlogo.png"]];
    [self addSubview:abh];
    
    intro = [[UILabel alloc] init];
    intro.text = @"Start by selecting your age group";
    [self addSubview:intro];
    
    group1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [group1 setTitle:@" 1-3 years " forState:UIControlStateNormal];
    [group1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    group1.layer.cornerRadius = 10.0f;
    [[group1 layer] setBorderWidth:1.0f];
    [group1 addTarget:self action:@selector(setRDAWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:group1];
    
    group2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [group2 setTitle:@" 4-8 years " forState:UIControlStateNormal];
    [group2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    group2.layer.cornerRadius = 10.0f;
    [[group2 layer] setBorderWidth:1.0f];
    [group2 addTarget:self action:@selector(setRDAWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:group2];
    
    group3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [group3 setTitle:@" 9-18 years " forState:UIControlStateNormal];
    [group3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    group3.layer.cornerRadius = 10.0f;
    [[group3 layer] setBorderWidth:1.0f];
    [group3 addTarget:self action:@selector(setRDAWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:group3];
    
    group4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [group4 setTitle:@" 19-50 years " forState:UIControlStateNormal];
    [group4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    group4.layer.cornerRadius = 10.0f;
    [[group4 layer] setBorderWidth:1.0f];
    [group4 addTarget:self action:@selector(setRDAWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:group4];
    
    man = [UIButton buttonWithType:UIButtonTypeSystem];
    [man setTitle:@" 51-70 M " forState:UIControlStateNormal];
    [man setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    man.layer.cornerRadius = 10.0f;
    [[man layer] setBorderWidth:1.0f];
    [man addTarget:self action:@selector(setRDAWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:man];
    
    woman = [UIButton buttonWithType:UIButtonTypeSystem];
    [woman setTitle:@" 51-70 W " forState:UIControlStateNormal];
    [woman setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    woman.layer.cornerRadius = 10.0f;
    [[woman layer] setBorderWidth:1.0f];
    [woman addTarget:self action:@selector(setRDAWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:woman];
    
    old = [UIButton buttonWithType:UIButtonTypeSystem];
    [old setTitle:@" 71+ years " forState:UIControlStateNormal];
    [old setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    old.layer.cornerRadius = 10.0f;
    [[old layer] setBorderWidth:1.0f];
    [old addTarget:self action:@selector(setRDAWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:old];
    
    group5 = [UIButton buttonWithType:UIButtonTypeSystem];
    [group5 setTitle:@" 14-18 years " forState:UIControlStateNormal];
    [group5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    group5.layer.cornerRadius = 10.0f;
    [[group5 layer] setBorderWidth:1.0f];
    [group5 addTarget:self action:@selector(setRDAWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:group5];
    
    group6 = [UIButton buttonWithType:UIButtonTypeSystem];
    [group6 setTitle:@" 19-50 years " forState:UIControlStateNormal];
    [group6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    group6.layer.cornerRadius = 10.0f;
    [[group6 layer] setBorderWidth:1.0f];
    [group6 addTarget:self action:@selector(setRDAWithButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:group6];
    
    pregnant = [[UILabel alloc] init];
    pregnant.text = @" - Pregnant or nursing - ";
    pregnant.font = [UIFont fontWithName:@"Helvetica" size:10];
    [self addSubview:pregnant];
}

- (void)setRDAWithButton:(UIButton *)sender {
    long hypenIndex = ((NSRange)[sender.titleLabel.text rangeOfString:@"-"]).location;
    if (hypenIndex > sender.titleLabel.text.length) {
        self.RDA = 1200; //71+
    } else {
        char before = [sender.titleLabel.text characterAtIndex:hypenIndex - 1];
        char after = [sender.titleLabel.text characterAtIndex:hypenIndex + 1];
        if (before == '9') {
            if ([sender.titleLabel.text characterAtIndex:hypenIndex - 2] != '1') {
                self.RDA = 1300; //9-18
            } else {
                self.RDA = 1000; //19-50p
            }
        } else if (before == '1') {
            if (after == '3') {
                self.RDA = 700;
            } else {
                char gender = [sender.titleLabel.text characterAtIndex:hypenIndex + 4];
                if (gender == 'M') {
                    self.RDA = 1000;
                } else {
                    self.RDA = 1200;
                }
            }
        } else if (before == '1') {
            if ([sender.titleLabel.text characterAtIndex:hypenIndex - 2] != '1') {
                self.RDA = 1000; //4-8
            } else {
                self.RDA = 1300; //14-18p
            }
        }
    }
    ABHFoodViewController *foodViewController = [[ABHFoodViewController alloc] init];
    [self.parent presentViewController:foodViewController animated:YES completion:nil];
}

- (void)updateConstraints {
    
    [abh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(64 + 15));
        make.centerX.equalTo(@0);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
    }];
    
    [intro mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(abh.mas_bottom).with.offset(20);
        make.centerX.equalTo(@0);
    }];
    
    [group1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(intro.mas_bottom).with.offset(15);
        make.left.equalTo(@90);
        make.width.equalTo(group4.mas_width);
    }];

    [group2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(intro.mas_bottom).with.offset(15);
        make.left.equalTo(group1.mas_right).with.offset(20);
        make.width.equalTo(group4.mas_width);
    }];
    
    [group3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(group1.mas_bottom).with.offset(20);
        make.centerX.equalTo(group1.mas_centerX);
        make.width.equalTo(group4.mas_width);
    }];
    
    [group4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(group1.mas_bottom).with.offset(20);
        make.centerX.equalTo(group2.mas_centerX);
    }];
    
    [man mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(group3.mas_bottom).with.offset(20);
        make.centerX.equalTo(group1.mas_centerX);
        make.width.equalTo(group4.mas_width);
    }];
    
    [woman mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(group3.mas_bottom).with.offset(20);
        make.centerX.equalTo(group2.mas_centerX);
        make.width.equalTo(group4.mas_width);
    }];
    
    [old mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(man.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(group4.mas_width);

    }];
    
    [pregnant mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(old.mas_bottom).with.offset(15);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [group5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pregnant.mas_bottom).with.offset(20);
        make.centerX.equalTo(group1.mas_centerX);
        make.width.equalTo(group4.mas_width);
    }];
    
    [group6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pregnant.mas_bottom).with.offset(20);
        make.centerX.equalTo(group2.mas_centerX);
        make.width.equalTo(group4.mas_width);
    }];
    
    [super updateConstraints];
}

@end
