//
//  ABHCongratsViewController.m
//  CALcium
//
//  Created by Melissa Huang on 11/2/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import "ABHCongratsViewController.h"
#import "ABHCongratsView.h"

@interface ABHCongratsViewController ()

@end

@implementation ABHCongratsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView {
    ABHCongratsView *congratsView = [[ABHCongratsView alloc] initWithRDA:self.RDA];
    self.view = congratsView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
