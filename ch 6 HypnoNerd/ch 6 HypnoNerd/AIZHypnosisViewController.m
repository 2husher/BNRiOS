//
//  AIZHypnosisViewController.m
//  ch 6 HypnoNerd
//
//  Created by X on 15/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZHypnosisViewController.h"
#import "AIZHypnosisView.h"

@interface AIZHypnosisViewController () <UITextFieldDelegate>

@end

@implementation AIZHypnosisViewController

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

- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].bounds;
    AIZHypnosisView *backgroundView = [[AIZHypnosisView alloc]
                                       initWithFrame:frame];

    CGRect textFieldRect   = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];

    textField.borderStyle   = UITextBorderStyleRoundedRect;
    textField.placeholder   = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;

    textField.delegate = self;

    [backgroundView addSubview:textField];

    self.view = backgroundView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"AIZHypnosisViewController loaded its view");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];

    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i <= 20; i++)
    {
        UILabel *messageLabel = [[UILabel alloc] init];

        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;

        [messageLabel sizeToFit];

        int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x = arc4random() % width;

        int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        int y = arc4random() % height;

        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;

        [self.view addSubview:messageLabel];
    }
}

@end
