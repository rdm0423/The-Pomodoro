//
//  POTimer.h
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString * const TimerCompleteNotification = @"TimerComplete";
NSString * const SecondTickNotification = @"SecondTick";

@interface POTimer : NSObject

@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;

+ (POTimer *)sharedInstance;
- (void)startTimer;
- (void)cancelTimer;


@end
