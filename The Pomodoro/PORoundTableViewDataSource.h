//
//  PORoundTableViewDataSource.h
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PORoundTableViewDataSource : NSObject <UITableViewDataSource>

- (NSArray *)timesForEachRound;

@end
