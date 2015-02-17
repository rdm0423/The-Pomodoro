//
//  RoundsViewController.h
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundsViewController : UIViewController

@property (nonatomic, assign) NSInteger currentRound;
@property (nonatomic, strong) UITableView *tableView;

- (NSArray *)timesForEachRound;

@end
