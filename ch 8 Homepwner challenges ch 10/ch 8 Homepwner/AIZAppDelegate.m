//
//  AIZAppDelegate.m
//  ch 8 Homepwner
//
//  Created by X on 21/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAppDelegate.h"
#import "AIZItemsViewController.h"

@interface AIZAppDelegate ()

@end

@implementation AIZAppDelegate


- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    AIZItemsViewController *itemsViewController = [[AIZItemsViewController alloc]
                                                   init];
    UINavigationController *navigationController =
        [[UINavigationController alloc] initWithRootViewController:itemsViewController];
    self.window.rootViewController = navigationController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end