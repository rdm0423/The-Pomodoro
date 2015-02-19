//
//  TimerViewController.m
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TimerViewController.h"
#import "RoundsViewController.h"
#import "POTimer.h"

@interface TimerViewController ()

@property (nonatomic, assign) BOOL active;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *timerButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageBlock;

@end

@implementation TimerViewController



- (void)registerFOrNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTimerLabel) name:SecondTickNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newRound:) name:NewRoundTimeNotificationName object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateButton) name:TimerCompleteNotification object:nil];
}

- (void)unregisterForNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NewRoundTimeNotificationName object:nil];
}

- (void)dealloc {
    [self unregisterForNotifications];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerFOrNotifications];
    
    self.title = @"Focus";
    
    ////// Set color
    
    [self updateTimerLabel];
    
}


- (IBAction)startTimer:(id)sender {
    [[POTimer sharedInstance] startTimer];
    self.timerButton.enabled = NO;
    [self.timerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

//- (IBAction)timerButton:(id)sender {
//    [[POTimer sharedInstance] startTimer];
//    self.timerButton.enabled = NO;
//    [self.timerButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//}

- (void)newRound:(NSNotification *)notification {
    [self updateTimerLabel];
    [self updateButton];
}

- (void)updateTimerLabel{
    if ([POTimer sharedInstance].seconds < 10) {
        self.timerLabel.text = [NSString stringWithFormat:@"%ld:0%ld", (long)[POTimer sharedInstance].minutes, (long)[POTimer sharedInstance].seconds];
    } else {
        self.timerLabel.text = [NSString stringWithFormat:@"%ld:%ld", (long)[POTimer sharedInstance].minutes, (long)[POTimer sharedInstance].seconds];
    }
    
}


- (void)updateButton {
    
    if(self.timerButton.enabled == NO)
    {
        self.timerButton.enabled = YES;

    }else{
        self.timerButton.enabled = NO;
    }
    
    [self.timerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}


@end
