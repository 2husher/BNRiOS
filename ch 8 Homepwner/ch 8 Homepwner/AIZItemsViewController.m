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
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

# pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[AIZItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc]
//                             initWithStyle:UITableViewCellStyleDefault
//                             reuseIdentifier:@"UITableViewCell"];

    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                        forIndexPath:indexPath];

    NSArray *items = [[AIZItemStore sharedStore] allItems];
    AIZItem *item  = items[indexPath.row];

    cell.textLabel.text = [item description];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

@end
























