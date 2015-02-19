//
//  AlertViewController.h
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/18/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *selectNextRow = @"select";

@interface AlertViewController : UIViewController

+ (AlertViewController *)sharedInstance;

- (void)presentAlertViewController;

@end
