//
//  AIZDetailViewController.m
//  ch 8 Homepwner
//
//  Created by X on 27/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDetailViewController.h"
#import "AIZItem.h"

@interface AIZDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumber;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation AIZDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    AIZItem *item = self.item;

    self.nameField.text    = item.itemName;
    self.serialNumber.text = item.serialNumber;
    self.valueField.text   = [NSString stringWithFormat:@"%ld", item.valInDollars];
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter)
    {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self.view endEditing:YES];

    AIZItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumber.text;
    item.valInDollars = [self.valueField.text intValue];
}

- (void)setItem:(AIZItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}

@end
