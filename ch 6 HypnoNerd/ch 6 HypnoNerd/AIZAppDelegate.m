//
//  AIZAppDelegate.m
//  ch 6 HypnoNerd
//
//  Created by X on 15/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAppDelegate.h"
#import "AIZHypnosisViewController.h"
#import "AIZReminderViewController.h"

@interface AIZAppDelegate ()

@end

@implementation AIZAppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    AIZHypnosisViewController *hvc = [[AIZHypnosisViewController alloc] init];

    NSBundle *appBundle = [NSBundle mainBundle];
    AIZReminderViewController *rvc = [[AIZReminderViewController alloc]
                                      initWithNibName:@"AIZReminderViewController"
                                      bundle:appBundle];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[hvc, rvc];

    self.window.rootViewController = tabBarController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end