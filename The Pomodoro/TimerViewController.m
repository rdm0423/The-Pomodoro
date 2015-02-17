//
//  TimerViewController.m
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TimerViewController.h"
#import "POTimer.h"

@interface TimerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *timerButton;

@end

@implementation TimerViewController

- (void)registerFOrNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTimerLabel) name:SecondTickNotification object:nil];
    
}

- (void)unregisterForNotifications {
    [NSNotificationCenter defaultCenter] removeObserver:self name: object:nil];
    
}

- (void)dealloc {
    [self unregisterForNotifications];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    

}



- (IBAction)timerButton:(id)sender {
    
    
    
}

- (void)updateTimerLabel {
    if ([POTimer sharedInstance].seconds < 10) {
        self.timerLabel.text = [NSString stringWithFormat:@"%ld:0%ld", (long)[POTimer sharedInstance].minutes, (long)[POTimer sharedInstance].seconds];
    } else {
        self.timerLabel.text = [NSString stringWithFormat:@"%ld:%ld", (long)[POTimer sharedInstance].minutes, (long)[POTimer sharedInstance].seconds];
    }
    
}



@end
