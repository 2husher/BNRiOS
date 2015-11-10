//
//  AIZDetailViewController.h
//  ch 8 Homepwner
//
//  Created by X on 27/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AIZItem;

@interface AIZDetailViewController : UIViewController

@property (nonatomic, strong) AIZItem *item;

- (IBAction)takePicture:(id)sender;

@end
