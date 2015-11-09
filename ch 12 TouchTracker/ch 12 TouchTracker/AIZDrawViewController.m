//
//  AIZDrawViewController.m
//  ch 12 TouchTracker
//
//  Created by X on 09/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDrawViewController.h"
#import "AIZDrawView.h"

@implementation AIZDrawViewController

- (void)loadView
{
    self.view = [[AIZDrawView alloc] initWithFrame:CGRectZero];
}

@end
