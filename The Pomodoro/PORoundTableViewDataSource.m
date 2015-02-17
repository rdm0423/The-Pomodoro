//
//  PORoundTableViewDataSource.m
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PORoundTableViewDataSource.h"

@implementation PORoundTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self timesForEachRound].count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    return cell;
}

- (NSArray *)timesForEachRound
{
    return @[@25, @5, @25, @5, @25, @5, @25, @15];
}

@end
