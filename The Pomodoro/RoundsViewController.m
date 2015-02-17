//
//  RoundsViewController.m
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsViewController.h"
#import "PORoundTableViewDataSource.h"
#import "POTimer.h"
#import "TimerViewController.h"

@interface RoundsViewController () <UITableViewDelegate>

@property (nonatomic, strong) PORoundTableViewDataSource *dataSource;

@end

@implementation RoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.tableView];
    
    
    self.dataSource = [PORoundTableViewDataSource new];
    self.tableView.dataSource = self.dataSource;
}

- (void)roundSelected
{
    [POTimer sharedInstance].minutes = [[self.dataSource.timesForEachRound objectAtIndex:self.currentRound] integerValue];
    [POTimer sharedInstance].seconds = 0;
}

@end
