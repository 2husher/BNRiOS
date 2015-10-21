//
//  AIZItemStore.m
//  ch 8 Homepwner
//
//  Created by X on 21/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZItemStore.h"
#import "AIZItem.h"

@interface AIZItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation AIZItemStore

+ (instancetype)sharedStore
{
    static AIZItemStore *sharedStore = nil;

    if (!sharedStore)
    {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[AIZItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self)
    {
        self.privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems
{
    return self.privateItems;
}

- (AIZItem *)createItem
{
    AIZItem *item = [AIZItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

@end





























