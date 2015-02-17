//
//  POAppDelegate.m
//  The Pomodoro
//
//  Created by Joshua Howland on 6/3/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "POAppDelegate.h"
#import "TimerViewController.h"
#import "RoundsViewController.h"

@implementation POAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    RoundsViewController *roundsViewController = [RoundsViewController new];
    roundsViewController.tabBarItem.title = @"Rounds";
    roundsViewController.tabBarItem.image = [UIImage imageNamed:@"list"];
    
    TimerViewController *timerViewController = [TimerViewController new];
    timerViewController.tabBarItem.title = @"Timer";
    timerViewController.tabBarItem.image = [UIImage imageNamed:@"time"];
    
    
    UITabBarController *tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[roundsViewController, timerViewController];
    self.window.rootViewController = tabBarController;
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
