//
//  ABHFoodViewController.h
//  CALcium
//
//  Created by Melissa Huang on 11/1/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpeechKit/SpeechKit.h>

@interface ABHFoodViewController : UIViewController <SpeechKitDelegate, SKRecognizerDelegate>

@property (strong, nonatomic) SKRecognizer* voiceSearch;
- (void)recordButtonTapped:(id)sender;
@end
