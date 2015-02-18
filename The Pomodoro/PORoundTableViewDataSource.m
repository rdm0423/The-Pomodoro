//
//  PORoundTableViewDataSource.m
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PORoundTableViewDataSource.h"

static NSString * const CurrentRoundKey = @"CurrentRound";


@implementation PORoundTableViewDataSource


//- (id)init {
//    if (self = [self init]) {
//        self.currentRound = [[NSUserDefaults standardUserDefaults] integerForKey:CurrentRoundKey];
//    }
//    return self;
//}


- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self timesForEachRound] count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Round %ld = %@ min", indexPath.row + 1, [[[self timesForEachRound] objectAtIndex:indexPath.row] stringValue]];
    return cell;
}

- (NSNumber *)roundAtIndex:(NSInteger)index {
    return [self timesForEachRound][index];
}

- (NSArray *)timesForEachRound
{
    return @[@25, @0, @25, @5, @25, @5, @25, @15];
}

- (void)setCurrentRound:(NSInteger)currentRound {
    
    if (currentRound >= [[self timesForEachRound] count]) {
        _currentRound = 0;
    } else {
        _currentRound = currentRound;
    }
    [[NSUserDefaults standardUserDefaults] setValue:@(currentRound) forKey:CurrentRoundKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
