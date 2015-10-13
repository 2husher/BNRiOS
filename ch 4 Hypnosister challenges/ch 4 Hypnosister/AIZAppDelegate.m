//
//  AIZAppDelegate.m
//  ch 4 Hypnosister
//
//  Created by X on 12/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAppDelegate.h"
#import "AIZHypnosisView.h"

@interface AIZAppDelegate ()

@end

@implementation AIZAppDelegate


- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    CGRect firstFrame          = self.window.bounds;
    AIZHypnosisView *firstView = [[AIZHypnosisView alloc]
                                  initWithFrame:firstFrame ];

    NSLog(@"FirstView subviews: %@", firstView.subviews);
    NSLog(@"Window subviews: %@", self.window.subviews);

    [self.window addSubview:firstView];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    NSLog(@"Window subviews: %@", self.window.subviews);
    return YES;
}

@end
