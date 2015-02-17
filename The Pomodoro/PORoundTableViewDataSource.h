//
//  PORoundTableViewDataSource.h
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PORoundTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, assign) NSInteger currentRound;

- (NSNumber *)roundAtIndex:(NSInteger)index;
- (void)registerTableView:(UITableView *)tableView;
- (NSArray *)timesForEachRound;


@end
