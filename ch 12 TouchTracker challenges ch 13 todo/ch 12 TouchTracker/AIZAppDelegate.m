//
//  AIZAppDelegate.m
//  ch 12 TouchTracker
//
//  Created by X on 09/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAppDelegate.h"
#import "AIZDrawViewController.h"

@implementation AIZAppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    AIZDrawViewController *dvc = [[AIZDrawViewController alloc] init];
    self.window.rootViewController = dvc;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end