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

@end
