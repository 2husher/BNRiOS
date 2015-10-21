//
//  AIZItem.m
//  ch 2 RandomItems
//
//  Created by X on 10/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZItem.h"

@implementation AIZItem

+ (instancetype)randomItem
{
    NSArray *randomAdjectiveList = @[@"Yellow", @"Green", @"Orange"];
    NSArray *randomNounList      = @[@"Table", @"Spoon", @"Fork"];
    NSUInteger adjectiveIndex    = arc4random() % [randomAdjectiveList count];
    NSUInteger nounIndex         = arc4random() % [randomNounList count];

    NSString *randomItemName = [NSString stringWithFormat:@"%@ %@",
                                randomAdjectiveList[adjectiveIndex],
                                randomNounList[nounIndex]];
    NSInteger randomValue = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];

    AIZItem *newItem = [[self alloc] initWithItemName:randomItemName
                                          serialNumber:randomSerialNumber
                                          valInDollars:randomValue];
    return newItem;
}

- (instancetype)initWithItemName:(NSString *)itemName
                    serialNumber:(NSString *)serialNumber
                    valInDollars:(NSInteger)valInDollars
{
    self = [super init];
    if (self)
    {
        _itemName     = itemName;
        _serialNumber = serialNumber;
        _valInDollars = valInDollars;
        _dateCreated  = [[NSDate alloc] init];
    }
    return self;
}

- (instancetype)initWithItemName:(NSString *)itemName
{
    return [self initWithItemName:itemName
                     serialNumber:@""
                     valInDollars:0];
}

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}

# pragma mark - Others Methods

- (void)dealloc
{
    NSLog(@"Destroyed %@", self);
}

- (NSString *)description
{
    NSString *descriptionStr = [NSString stringWithFormat:@"%@ (%@): Worth $%ld, recorded on %@",
                                self.itemName,
                                self.serialNumber,
                                self.valInDollars,
                                self.dateCreated];
    return descriptionStr;
}

@end
