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
#import "AIZQuizViewController.h"

@interface AIZAppDelegate ()

@end

@implementation AIZAppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
    {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:
                                                       UIUserNotificationTypeAlert|
                                                       UIUserNotificationTypeBadge|
                                                       UIUserNotificationTypeSound categories:nil]];
    }

    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];

    AIZHypnosisViewController *hvc = [[AIZHypnosisViewController alloc] init];
    AIZReminderViewController *rvc = [[AIZReminderViewController alloc] init];
    AIZQuizViewController     *qvc = [[AIZQuizViewController alloc] init];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[hvc, rvc, qvc];

    self.window.rootViewController = tabBarController;

    self.window.backgroundColor = [UIColor whiteColor];

    return YES;
}

@end