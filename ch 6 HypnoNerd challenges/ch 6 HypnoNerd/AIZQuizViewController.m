//
//  AIZQuizViewController.m
//  ch 1 Quiz
//
//  Created by X on 09/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZQuizViewController.h"

@interface AIZQuizViewController ()

@property (nonatomic) NSInteger currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation AIZQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.questions = @[
                           @"From what is cognac made?",
                           @"What is 7 + 7?",
                           @"What is the capital of Vermont?"
                           ];
        self.answers   = @[
                           @"Grapes",
                           @"14",
                           @"Montpelier"
                           ];
        self.tabBarItem.title = @"Quiz";
        self.tabBarItem.image = [UIImage imageNamed:@"Quiz"];
    }
    return self;
}

-(IBAction)showQuestion:(id)sender
{
    self.currentQuestionIndex++;
    if (self.currentQuestionIndex == [self.questions count])
    {
        self.currentQuestionIndex = 0;
    }
    NSString *question      = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    self.answerLabel.text   = @"???";
}

-(IBAction)showAnswer:(id)sender
{
    NSString *answer      = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

@end
