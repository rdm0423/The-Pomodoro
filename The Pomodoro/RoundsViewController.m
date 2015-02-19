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
#import "AlertViewController.h"

@interface RoundsViewController () <UITableViewDelegate>

@property (nonatomic, strong) PORoundTableViewDataSource *dataSource;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RoundsViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        
//        [self registerForNotifications];
//    }
//    return self;
//}


- (void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectNextRowAfterNotification) name:selectNextRow object:nil];
}

- (void)unregisterForNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TimerCompleteNotification object:nil];
}

- (void)dealloc {
    [self unregisterForNotifications];
}

- (void)selectNextRowAfterNotification
{
    NSInteger index = self.dataSource.currentRound;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index + 1 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition: UITableViewScrollPositionNone];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerForNotifications];
    
    self.title = @"Rounds";
    
    self.dataSource = [PORoundTableViewDataSource new];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];   // removes table lines
    [self.view addSubview:self.tableView];

    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self selectCurrentRound];
    [self updateTimer];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.dataSource.currentRound = indexPath.row;
    [self updateTimer];
    [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil];
}

//- (void)roundSelected
//{
//    [POTimer sharedInstance].minutes = [[self.dataSource.timesForEachRound objectAtIndex:self.currentRound] integerValue];
//    [POTimer sharedInstance].seconds = 0;
//}

- (void)updateTimer {
    [[POTimer sharedInstance] cancelTimer];
    [POTimer sharedInstance].minutes = [[self.dataSource roundAtIndex:self.dataSource.currentRound] integerValue];  // ROund selected elements
    [POTimer sharedInstance].seconds = 0;               // ROund selected elements
    [[NSNotificationCenter defaultCenter] postNotificationName:NewRoundTimeNotificationName object:nil userInfo:nil];
}

- (void)endRound:(NSNotification *)notification {
    self.dataSource.currentRound++;
    [self selectCurrentRound];
    [self updateTimer];
}

- (void)selectCurrentRound {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.dataSource.currentRound inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop];
}






@end
