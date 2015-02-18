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
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.44 green:1.17 blue:2.03 alpha:1.0]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                          NSForegroundColorAttributeName : [UIColor colorWithRed:44.00 green:117.00 blue:203.00 alpha:1.0],
                                                          NSFontAttributeName : [UIFont fontWithName:@"Baskerville-Bold" size:24.0f],
                                                          NSShadowAttributeName : shadow
                                                          }];
    
    [[UINavigationBar appearanceWhenContainedIn:[TimerViewController class], nil] setBarTintColor:[UIColor blueColor]];
    
    
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:0.239 green:0.240 blue:0.242 alpha:1.0]];
    
    
    
    
}



@end
