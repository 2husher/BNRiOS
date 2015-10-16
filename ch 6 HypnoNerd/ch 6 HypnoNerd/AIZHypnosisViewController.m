//
//  AIZHypnosisViewController.m
//  ch 6 HypnoNerd
//
//  Created by X on 15/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZHypnosisViewController.h"
#import "AIZHypnosisView.h"

@implementation AIZHypnosisViewController

- (void)loadView
{
    AIZHypnosisView *backgroundView = [[AIZHypnosisView alloc] init];
    self.view = backgroundView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed:@"Hypno"];
        self.tabBarItem.image = i;
    }
    return self;
}

@end
