//
//  main.m
//  ch 2 RandomItems
//
//  Created by X on 10/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIZItem.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSMutableArray *items = [[NSMutableArray alloc] init];

        AIZItem *backpack = [[AIZItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];

        AIZItem *calculator = [[AIZItem alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];

        backpack.containedItem = calculator;

        backpack   = nil;
        calculator = nil;

        for (AIZItem *item in items)
        {
            NSLog(@"%@", item);
        }

        NSLog(@"Setting items to nil...");
        items = nil;
    }
    return 0;
}
