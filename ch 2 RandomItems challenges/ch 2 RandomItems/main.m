//
//  main.m
//  ch 2 RandomItems
//
//  Created by X on 10/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIItem.h"
#import "AIContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        NSMutableArray *items = [[NSMutableArray alloc] init];
        AIContainer *container = [[AIContainer alloc] init];

//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//        [items insertObject:@"Zero" atIndex:0];
//
//        for (NSString *item in items)
//        {
//            NSLog(@"%@", item);
//        }
       // AIItem *item = [[AIItem alloc] init];
//        [item setItemName:@"Red Sofa"];
       // item.itemName = @"Red Sofa";
//        [item setSerialNumber:@"A1B2C"];
       // item.serialNumber = @"A1B2C";
//        [item setValInDollars:100];
       // item.valInDollars = 100;
//        NSLog(@"%@, %@, %ld, %@", [item itemName], [item serialNumber], [item valInDollars], [item dateCreated]);
//        AIItem *item = [[AIItem alloc] initWithItemName:@"Red Sofa"
//                                           serialNumber:@"A1B2C"
//                                           valInDollars:100];
//        NSLog(@"%@, %@, %ld, %@", item.itemName, item.serialNumber, item.valInDollars, item.dateCreated);
//        NSLog(@"%@", item);
//
//        AIItem *itemWithName = [[AIItem alloc] initWIthItemName:@"Blue Sofa"];
//        NSLog(@"%@", itemWithName);
//
//        AIItem *itemWithNoName = [[AIItem alloc] init];
//        NSLog(@"%@", itemWithNoName);

        for (int i = 0; i < 10; i++)
        {
            AIItem *item = [AIItem randomItem];
            [container addItem:item];
        }


        AIItem *newItem = [[AIItem alloc] initWithName:@"Carpet"
                                          serialNumber:@"7G5F0"];

        AIContainer *newContainer = [[AIContainer alloc]
                                     initWithName:@"Box"
                                     serialNumber:@"7F7F7"
                                     valInDollars:555
                                     subitems:[NSMutableArray arrayWithObject:newItem]];
        [container addItem:newContainer];

        NSLog(@"%@", container);

        container = nil;

    }
    return 0;
}
