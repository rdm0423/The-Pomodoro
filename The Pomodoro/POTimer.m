//
//  POTimer.m
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "POTimer.h"

NSString * const TimerCompleteNotification = @"TimerComplete";
NSString * const SecondTickNotification = @"SecondTick";

@interface POTimer ()

@property (nonatomic, assign) BOOL isOn;

@end

@implementation POTimer

+ (POTimer *)sharedInstance {
    static POTimer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [POTimer new];
    });
    return sharedInstance;
    
}

- (void)startTimer {
    
    self.isOn = YES;
    [self isActive];
}

- (void)cancelTimer {
    self.isOn = NO;
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(decreaseSecond) object:nil];
}

- (void)endTimer {
    self.isOn = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TimerCompleteNotification object:nil userInfo:nil];
}

- (void)decreaseSecond {
    
    if (self.seconds > 0) {
        self.seconds--;
    }
    if (self.minutes > 0) {
        if (self.seconds == 0) {
            self.seconds = 59;
            self.minutes--;
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil userInfo:nil];
        
    } else {
        if (self.seconds == 0) {
            [self endTimer];
        }
    }
    
}

- (void)isActive {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    if (self.isOn == YES) {
        [self decreaseSecond];
        [self performSelector:@selector(isActive) withObject:nil afterDelay:1.0];
    }
    
}



@end
