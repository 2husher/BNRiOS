//
//  AIZItemsViewController.m
//  ch 8 Homepwner
//
//  Created by X on 21/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZItemsViewController.h"
#import "AIZItemStore.h"
#import "AIZItem.h"

@interface AIZItemsViewController ()

@property (nonatomic) NSMutableArray *itemsCheaper50;
@property (nonatomic) NSMutableArray *itemsExpens50;

@end

@implementation AIZItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        for (int i = 0; i < 5; i++)
        {
            [[AIZItemStore sharedStore] createItem];
        }

        self.itemsCheaper50 = [[NSMutableArray alloc] init];
        self.itemsExpens50  = [[NSMutableArray alloc] init];

        [self setItemsCheaperAndExpens50];

        [self setLastRow];
    }
    return self;
}

- (void) setItemsCheaperAndExpens50
{
    NSArray *items = [[AIZItemStore sharedStore] allItems];
    for (AIZItem *item in items)
    {
        if (item.valInDollars >= 50)
        {
            [self.itemsExpens50 addObject:item];
        }
        else
        {
            [self.itemsCheaper50 addObject:item];
        }
    }
}

- (void) setLastRow
{
    if ([self.itemsCheaper50 lastObject] == nil)
    {
        [self.itemsExpens50 addObject:@"No more items!"];
    }
    else
    {
        [self.itemsCheaper50 addObject:@"No more items!"];
    }
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];

    self.tableView.backgroundView =
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"temple"]];
}

# pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;
    switch (section)
    {
        case 0:
            count = [self.itemsExpens50 count];
            break;
        case 1:
            count = [self.itemsCheaper50 count];
            break;
        default:
            break;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                        forIndexPath:indexPath];

    AIZItem *item = nil;
    switch (indexPath.section)
    {
        case 0:
            item = self.itemsExpens50[indexPath.row];
            break;
        case 1:
            item = self.itemsCheaper50[indexPath.row];
            break;
        default:
            break;
    }
    item = [self itemForIndexPath:indexPath];

    cell.textLabel.text = [item description];
    if ([[item description] isEqualToString:@"No more items!"] == NO)
    {
        cell.textLabel.font = [UIFont systemFontOfSize:20.0];
    }
    return cell;
}

-(AIZItem *)itemForIndexPath:(NSIndexPath *)indexPath
{
    AIZItem *item = nil;
    switch (indexPath.section)
    {
        case 0:
            item = self.itemsExpens50[indexPath.row];
            break;
        case 1:
            item = self.itemsCheaper50[indexPath.row];
            break;
        default:
            break;
    }
    return item;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = 0;

    AIZItem *item = nil;
    item = [self itemForIndexPath:indexPath];

    if ([[item description] isEqualToString:@"No more items!"] == NO)
    {
        rowHeight = 60;
    }
    else
    {
        rowHeight = 44;
    }
    return rowHeight;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    NSString *title = nil;
    switch (section)
    {
        case 0:
            title = @"Worth >= 50$";
            break;
        case 1:
            title = @"Worth < 50$";
        default:
            break;
    }
    return title;
}

@end
























