//
//  AIContainer.h
//  ch 2 RandomItems
//
//  Created by X on 11/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIItem.h"

@interface AIContainer : AIItem
{
    NSMutableArray *_subitems;
}

-(instancetype)initWithName:(NSString *)name
               serialNumber:(NSString *)serialNumber
               valInDollars:(NSUInteger)valInDollars
                   subitems:(NSMutableArray *)subitems;

-(void)setSubitems:(NSMutableArray *)subitems;
-(NSMutableArray *)subitems;

- (void)addItem:(id)item;

@end
