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

    CGRect firstFrame          = CGRectMake(200, 100, 100, 150);
    AIZHypnosisView *firstView = [[AIZHypnosisView alloc]
                                  initWithFrame:firstFrame ];
    firstView.backgroundColor  = [UIColor yellowColor];

    CGRect secondFrame          = CGRectMake(20, 30, 100, 200);
    AIZHypnosisView *secondView = [[AIZHypnosisView alloc]
                                   initWithFrame:secondFrame ];
    secondView.backgroundColor  = [UIColor greenColor];

    [self.window addSubview:firstView];
    [firstView addSubview:secondView];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    NSLog(@"Window subviews:");
    for (id view in self.window.subviews)
    {
        NSLog(@"View: %@", view);
    }
    return YES;
}

@end
