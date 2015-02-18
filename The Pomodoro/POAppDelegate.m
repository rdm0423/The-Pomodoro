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
#import "AppearanceController.h"
#import "AlertViewController.h"


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
    tabBarController.viewControllers = @[[[UINavigationController alloc] initWithRootViewController:roundsViewController], [[UINavigationController alloc] initWithRootViewController:timerViewController]];
    self.window.rootViewController = tabBarController;
    
    
    [AppearanceController setUpAppearance];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil]];
    } else {
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationType)(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    }
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {

    [[AlertViewController sharedInstance] presentAlertViewController];
    
    // The code below is a way to do it without creating a seperate AlertViewController Class
    
//    UIAlertController *alertController = [UIAlertController new];
//    alertController = [UIAlertController alertControllerWithTitle:@"Round Complete" message:@"Your Focus Round is Complete" preferredStyle:(UIAlertControllerStyleAlert)];
//    
//    [alertController addAction:[UIAlertAction actionWithTitle:@"Another Rounnd" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        
//        UITabBarController *rootTabBarController = (UITabBarController *)self.window.rootViewController;
//        
//        rootTabBarController.selectedViewController = rootTabBarController.viewControllers[0];
//        
//    }]];
//    
//    [alertController addAction:[UIAlertAction actionWithTitle:@"Finished" style:UIAlertActionStyleCancel handler:nil]];
//    
//    [self.window
//     .rootViewController presentViewController:alertController animated:YES completion:nil];
    
}



@end
