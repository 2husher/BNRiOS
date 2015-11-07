//
//  AIZDateViewController.m
//  ch 8 Homepwner
//
//  Created by X on 07/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDateViewController.h"
#import "AIZItem.h"

@interface AIZDateViewController ()

@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;

@end

@implementation AIZDateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.datePicker.date = self.item.dateCreated;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    self.item.dateCreated = [self.datePicker date];
}

@end
