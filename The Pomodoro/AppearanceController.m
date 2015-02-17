//
//  AppearanceController.m
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "AppearanceController.h"
#import "TimerViewController.h"
#import "RoundsViewController.h"

@implementation AppearanceController

+ (void)setUpAppearance {
    
    NSShadow *shadow = [NSShadow new];
    shadow.shadowColor = [UIColor darkGrayColor];
    shadow.shadowBlurRadius = 0.0;
    shadow.shadowOffset = CGSizeMake(0.0, 2.0);
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                          NSForegroundColorAttributeName : [UIColor whiteColor],
                                                          NSFontAttributeName : [UIFont fontWithName:@"Baskerville-Bold" size:24.0f],
                                                          NSShadowAttributeName : shadow
                                                          }];
    
    
    
    
}



@end
