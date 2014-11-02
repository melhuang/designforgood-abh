//
//  ABHFoodViewController.m
//  CALcium
//
//  Created by Melissa Huang on 11/1/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import "ABHFoodViewController.h"
#import "ABHFoodView.h"

@interface ABHFoodViewController ()

@end

@implementation ABHFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView {
    self.view = [[ABHFoodView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
