//
//  AIZHypnosisViewController.m
//  ch 6 HypnoNerd
//
//  Created by X on 15/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZHypnosisViewController.h"
#import "AIZHypnosisView.h"

@interface AIZHypnosisViewController ()

@property(nonatomic, strong) UISegmentedControl *segmentedControl;

@end

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"AIZHypnosisViewController loaded its view");
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect bounds = self.view.bounds;

    self.segmentedControl =
        [[UISegmentedControl alloc] initWithItems:@[@"red", @"green", @"blue"]];
    self.segmentedControl.center = CGPointMake(bounds.size.width / 2.0, 64);
    [self.view addSubview:self.segmentedControl];

    [self.segmentedControl addTarget:self
                              action:@selector(segmentChanged:)
                    forControlEvents:UIControlEventValueChanged];

}

- (void)segmentChanged:(UISegmentedControl *)sender
{
    if ([sender isEqual:self.segmentedControl])
    {
        NSInteger segmentIndex = [sender selectedSegmentIndex];
        NSString *segmentText  = [sender titleForSegmentAtIndex:segmentIndex];
        NSDictionary *colors = @{
                                 @"red":   [UIColor redColor],
                                 @"green": [UIColor greenColor],
                                 @"blue":  [UIColor blueColor]
                                 };
        for (NSString *color in colors) {
            if ([segmentText isEqualToString:color])
            {
                id view = self.view;
                if ([view respondsToSelector:@selector(circleColor)])
                {
                    [view setCircleColor:colors[color]];
                }
            }
            else
            {
                NSLog(@"ERROR: wrong color parameter");
            }
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);

    float red   = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue  = (arc4random() % 100) / 100.0;

    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    id view = self.view;
    if ([view respondsToSelector:@selector(circleColor)])
    {
        [view setCircleColor:randomColor];
    }
}

@end
