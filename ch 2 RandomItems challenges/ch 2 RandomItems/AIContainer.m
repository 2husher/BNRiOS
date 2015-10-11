//
//  AIContainer.m
//  ch 2 RandomItems
//
//  Created by X on 11/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIContainer.h"

@implementation AIContainer

# pragma mark - Initializers

- (instancetype)initWithName:(NSString *)name
                serialNumber:(NSString *)serialNumber
                valInDollars:(NSUInteger)valInDollars
                    subitems:(NSMutableArray *)subitems
{
    self = [super initWithName:name
                  serialNumber:serialNumber
                  valInDollars:valInDollars];
    if (self)
    {
        _subitems = subitems;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                serialNumber:(NSString *)serialNumber
                valInDollars:(NSInteger)valInDollars
{
    return [self initWithName:name
                 serialNumber:serialNumber
                 valInDollars:valInDollars
                     subitems:[NSMutableArray array]];
}

//- (instancetype)initWithName:(NSString *)name
//                serialNumber:(NSString *)serialNumber
//{
//    return [self initWithName:name
//                 serialNumber:serialNumber
//                 valInDollars:0];
//}

//- (instancetype)initWithName:(NSString *)name
//{
//    return [self initWithName:name
//                 serialNumber:@""];
//}

- (instancetype)init
{
    return [self initWithName:@"Container"];
}

# pragma mark - Setters/Getters

-(void)setSubitems:(NSMutableArray *)subitems
{
    _subitems = subitems;
}

-(NSMutableArray *)subitems
{
    return _subitems;
}

-(void)setItemName:(NSString *)itemName
{
    _itemName = itemName;
}

-(NSString *)itemName
{
    return _itemName;
}

-(void)setValInDollars:(NSUInteger)valInDollars
{
    _valInDollars = valInDollars;
}

-(NSUInteger)valInDollars
{
    return _valInDollars;
}

# pragma mark - Other Methods

- (void)addItem:(id)item
{
    [self.subitems addObject:item];
}

- (NSString *)description
{
    NSUInteger totalCost       = self.valInDollars;
    NSMutableString *itemsList = [[NSMutableString alloc] init];

    for (id item in self.subitems)
    {
        [itemsList appendFormat:@"\n- %@", item];
        totalCost += [item valInDollars];
    }

    NSString *descriptionStr = [NSString stringWithFormat:@"CONTAINER: %@(%@) $%ld on %@ with items: \nBEGIN%@\nEND",
                                self.itemName,
                                self.serialNumber,
                                totalCost,
                                self.dateCreated,
                                itemsList];

    return descriptionStr;
}

@end
