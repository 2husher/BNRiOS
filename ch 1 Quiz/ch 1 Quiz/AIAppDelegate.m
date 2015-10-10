//
//  AppDelegate.m
//  ch 1 Quiz
//
//  Created by X on 09/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIAppDelegate.h"
#import "AIQuizViewController.h"

@implementation AIAppDelegate

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    AIQuizViewController *quizVC = [[AIQuizViewController alloc] init];
    self.window.rootViewController = quizVC;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
