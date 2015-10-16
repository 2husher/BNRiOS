//
//  AIZReminderViewController.m
//  ch 6 HypnoNerd
//
//  Created by X on 15/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZReminderViewController.h"

@interface AIZReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation AIZReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        UITabBarItem *tbi = self.tabBarItem;
        tbi.title = @"Reminder";
        tbi.image = [UIImage imageNamed:@"Time"];
    }
    return self;
}

-(IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Added reminder at date %@", date);
}

@end
