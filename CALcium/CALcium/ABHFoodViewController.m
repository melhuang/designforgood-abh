//
//  ABHFoodViewController.m
//  CALcium
//
//  Created by Melissa Huang on 11/1/14.
//  Copyright (c) 2014 Melissa Huang. All rights reserved.
//

#import "ABHFoodViewController.h"
#import "ABHCongratsViewController.h"
#import "ABHFoodView.h"
#import "AppDelegate.h"

@interface ABHFoodViewController ()

@property (nonatomic) ABHFoodView *view;
@property (nonatomic) id appDelegate;

@end

const unsigned char SpeechKitApplicationKey[] = {0x59, 0xad, 0xf3, 0x73, 0xfe, 0x06, 0x59, 0x3b, 0xc6, 0x65, 0x82, 0xfa, 0x06, 0xc2, 0x34, 0x30, 0x4f, 0xe4, 0xc4, 0x59, 0xd7, 0x84, 0xe7, 0x9e, 0xcf, 0x35, 0x9b, 0x9c, 0xaa, 0xdf, 0x26, 0x03, 0x8c, 0x19, 0x77, 0x8b, 0x20, 0xd0, 0xc6, 0xe6, 0x35, 0x49, 0xe0, 0x3b, 0x0b, 0x14, 0x6c, 0x5a, 0xf8, 0x30, 0xb4, 0xcf, 0xb5, 0x9b, 0x6d, 0x84, 0xd0, 0x08, 0x20, 0x7a, 0xe7, 0x47, 0x7e, 0x74};


@implementation ABHFoodViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.messageLabel.text = @"Tap on the mic";
    self.calciumTotal = 0;
    
    self.appDelegate = (AppDelegate *)([UIApplication sharedApplication].delegate);
    [self.appDelegate setupSpeechKitConnection];
    
}



- (void)recordButtonTapped:(id)sender {
    self.view.recordButton.selected = !self.view.recordButton.isSelected;
    
    // This will initialize a new speech recognizer instance
    if (self.view.recordButton.isSelected) {
        self.voiceSearch = [[SKRecognizer alloc] initWithType:SKSearchRecognizerType
                                                    detection:SKShortEndOfSpeechDetection
                                                     language:@"en_US"
                                                     delegate:self];
    }
    
    // This will stop existing speech recognizer processes
    else {
        if (self.voiceSearch) {
            [self.voiceSearch stopRecording];
            [self.voiceSearch cancel];
        }
    }
}

- (void)loadView {
    self.view = [[ABHFoodView alloc] initWithDelegate:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - SKRecognizer Delegate Methods

- (void)recognizerDidBeginRecording:(SKRecognizer *)recognizer {
    self.view.messageLabel.text = @"Listening...";
}

- (void)recognizerDidFinishRecording:(SKRecognizer *)recognizer {
    self.view.messageLabel.text = @"Done Listening.";

}

- (void)recognizer:(SKRecognizer *)recognizer didFinishWithResults:(SKRecognition *)results {
    long numOfResults = [results.results count];
    
    if (numOfResults > 0) {
        // update the text of text field with best result from SpeechKit
        self.view.searchTextField.text = [results firstResult];
    }
    
    self.view.recordButton.selected = !self.view.recordButton.isSelected;
    
    if (self.voiceSearch) {
        [self.voiceSearch cancel];
    }
    
    NSString *food = self.view.searchTextField.text;
    float calcium = 0;
    if ([food isEqualToString:@"Low-fat yogurt"]) {
        calcium = 350;
    } else if ([food isEqualToString:@"Milk"]) {
        calcium = 250;
    } else if ([food isEqualToString:@"Cheese"]) {
        calcium = 150;
    } else if ([food isEqualToString:@"Pudding"]) {
        calcium = 55;
    } else if ([food isEqualToString:@"Tofu"]) {
        calcium = 350;
    } else if ([food isEqualToString:@"Vegetable lasagna"]) {
        calcium = 350;
    } else if ([food isEqualToString:@"Cheese enchilada"]) {
        calcium = 225;
    } else if ([food isEqualToString:@"Broccoli"]) {
        calcium = 20;
    } else if ([food isEqualToString:@"Sardines"]) {
        calcium = 325;
    } else if ([food isEqualToString:@"Cheese pizza"]) {
        calcium = 300;
    } else if ([food isEqualToString:@"Magic"]) {
        calcium = 2000;
    }
    self.calciumTotal += calcium;
    
    NSString *calcString = [[NSNumber numberWithFloat:calcium] stringValue];
    calcString = [calcString stringByAppendingString:@" mg"];
    
    
    self.view.amount.text = calcString;
    
    
    if (self.calciumTotal > self.RDA) {
        ABHCongratsViewController *congratsViewController = [[ABHCongratsViewController alloc] init];
        congratsViewController.RDA = self.RDA;
        [self presentViewController:congratsViewController animated:YES completion:nil];
    }
    [self.view.progressBar setProgress:(self.calciumTotal / self.RDA) animated:YES];
}


- (void)recognizer:(SKRecognizer *)recognizer didFinishWithError:(NSError *)error suggestion:(NSString *)suggestion {
    self.view.recordButton.selected = NO;
    self.view.messageLabel.text = @"Connection error";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:[error localizedDescription]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
