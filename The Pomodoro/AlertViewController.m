//
//  AlertViewController.m
//  The Pomodoro
//
//  Created by Ross McIlwaine on 2/18/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "AlertViewController.h"
#import "PORoundTableViewDataSource.h"

@interface AlertViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

+ (AlertViewController *)sharedInstance {
    static AlertViewController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [AlertViewController new];

    });
    return sharedInstance;
    
}
 

- (void)presentAlertViewController {
    UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;

    UIAlertController *alertController = [UIAlertController new];
    alertController = [UIAlertController alertControllerWithTitle:@"Round Complete" message:@"Your Focus Round is Complete" preferredStyle:(UIAlertControllerStyleAlert)];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Another Rounnd" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        tabBarController.selectedViewController = tabBarController.viewControllers[0];

        [[NSNotificationCenter defaultCenter] postNotificationName:selectNextRow object:nil];
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Finished" style:UIAlertActionStyleCancel handler:nil]];
    
    
    [tabBarController presentViewController:alertController animated:YES completion:nil];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
