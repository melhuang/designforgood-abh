//
//  ABHRootViewController.m
//  
//
//  Created by Melissa Huang on 11/1/14.
//
//

#import "ABHRootViewController.h"
#import "ABHRootView.h"

@interface ABHRootViewController ()

@end

@implementation ABHRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)loadView {
    [super loadView];
    ABHRootView *childView = [[ABHRootView alloc] init];
    childView.parent = self;
    self.view = childView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
