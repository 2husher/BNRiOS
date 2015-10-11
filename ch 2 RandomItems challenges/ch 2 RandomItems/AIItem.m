//
//  AIItem.m
//  ch 2 RandomItems
//
//  Created by X on 10/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIItem.h"

@implementation AIItem

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

    AIItem *newItem = [[self alloc] initWithName:randomItemName
                                    serialNumber:randomSerialNumber
                                    valInDollars:randomValue];
    return newItem;
}

- (instancetype)initWithName:(NSString *)name
                serialNumber:(NSString *)serialNumber
                valInDollars:(NSInteger)valInDollars
{
    self = [super init];
    if (self)
    {
        _itemName     = name;
        _serialNumber = serialNumber;
        _valInDollars = valInDollars;
        _dateCreated  = [[NSDate alloc] init];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                serialNumber:(NSString *)serialNumber
{
    return [self initWithName:name
                 serialNumber:serialNumber
                 valInDollars:0];
}

- (instancetype)initWithName:(NSString *)name
{
    return [self initWithName:name
                 serialNumber:@""];
}

- (instancetype)init
{
    return [self initWithName:@"Item"];
}

-(void)setItemName:(NSString *)itemName
{
    _itemName = itemName;
}

-(NSString *)itemName
{
    return _itemName;
}

-(void)setSerialNumber:(NSString *)serialNumber
{
    _serialNumber = serialNumber;
}

-(NSString *)serialNumber
{
    return _serialNumber;
}

-(void)setValInDollars:(NSUInteger)valInDollars
{
    _valInDollars = valInDollars;
}

-(NSUInteger)valInDollars
{
    return _valInDollars;
}

-(NSDate *)dateCreated
{
    return _dateCreated;
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
