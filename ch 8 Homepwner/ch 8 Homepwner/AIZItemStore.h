//
//  AIZItemStore.h
//  ch 8 Homepwner
//
//  Created by X on 21/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AIZItem;

@interface AIZItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore;

- (AIZItem *)createItem;
- (void)removeItem:(AIZItem *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;

@end
