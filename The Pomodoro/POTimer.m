//
//  POTimer.m
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "POTimer.h"

@interface POTimer ()

@property (nonatomic, strong) BOOL isOn;


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


- (bool)isOn {
    

}


- (void)startTimer {
    
    
    
}

- (void)cancelTimer {
    
    
}

- (void)endTimer {
    
    
}

- (void)decreaseSecond {
    
    
}

- (void)isActive {
    
    
}



@end
