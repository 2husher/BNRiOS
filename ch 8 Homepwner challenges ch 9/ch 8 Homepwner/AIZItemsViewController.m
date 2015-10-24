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

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation AIZItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[AIZItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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

    UIView *headerView = self.headerView;
    [self.tableView setTableHeaderView:headerView];
}

- (IBAction)addNewItem:(id)sender
{
    AIZItem *newItem = [[AIZItemStore sharedStore] createItem];
    NSInteger lastRow = [[[AIZItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow
                                                inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)toggleEditingMode:(id)sender
{
    if (self.isEditing)
    {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    }
    else
    {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (UIView *)headerView
{
    if (!_headerView)
    {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                      owner:self
                                    options:nil];
    }
    return _headerView;
}

- (void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSArray *items = [[AIZItemStore sharedStore] allItems];
        AIZItem *item = items[indexPath.row];
        [[AIZItemStore sharedStore] removeItem:item];

        [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void) tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[AIZItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row
                                        toIndex:destinationIndexPath.row];
}

- (NSString *)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remove";
}

@end
























