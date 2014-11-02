//
//  ABHFoodViewController.m
//  CALcium
//
//  Created by Melissa Huang on 11/1/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import "ABHFoodViewController.h"
#import "ABHFoodView.h"
#import "AppDelegate.h"

@interface ABHFoodViewController ()

@property (nonatomic) UILabel *messageLabel;
@property (nonatomic) id appDelegate;

@end

const unsigned char SpeechKitApplicationKey[] = {0x59, 0xad, 0xf3, 0x73, 0xfe, 0x06, 0x59, 0x3b, 0xc6, 0x65, 0x82, 0xfa, 0x06, 0xc2, 0x34, 0x30, 0x4f, 0xe4, 0xc4, 0x59, 0xd7, 0x84, 0xe7, 0x9e, 0xcf, 0x35, 0x9b, 0x9c, 0xaa, 0xdf, 0x26, 0x03, 0x8c, 0x19, 0x77, 0x8b, 0x20, 0xd0, 0xc6, 0xe6, 0x35, 0x49, 0xe0, 0x3b, 0x0b, 0x14, 0x6c, 0x5a, 0xf8, 0x30, 0xb4, 0xcf, 0xb5, 0x9b, 0x6d, 0x84, 0xd0, 0x08, 0x20, 0x7a, 0xe7, 0x47, 0x7e, 0x74};


@implementation ABHFoodViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.messageLabel.text = @"Tap on the mic";
//    self.activityIndicator.hidden = YES;
//    
//    if (!self.tableViewDisplayDataArray) {
//        self.tableViewDisplayDataArray = [[NSMutableArray alloc] init];
//    }
    
    self.appDelegate = (AppDelegate *)([UIApplication sharedApplication].delegate);
    [self.appDelegate setupSpeechKitConnection];
    
//    self.searchTextField.returnKeyType = UIReturnKeySearch;
}

- (void)loadView {
    self.view = [[ABHFoodView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
