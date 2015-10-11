//
//  AIItem.h
//  ch 2 RandomItems
//
//  Created by X on 10/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    NSUInteger _valInDollars;
    NSDate *_dateCreated;
}

+(instancetype)randomItem;

// Designated initializer for AIItem
-(instancetype)initWithName:(NSString *)name
               serialNumber:(NSString *)serialNumber
               valInDollars:(NSInteger)valInDollars;

-(instancetype)initWithName:(NSString *)name
               serialNumber:(NSString *)serialNumber;

-(instancetype)initWithName:(NSString *)name;

-(void)setItemName:(NSString *)itemName;
-(NSString *)itemName;

-(void)setSerialNumber:(NSString *)serialNumber;
-(NSString *)serialNumber;

-(void)setValInDollars:(NSUInteger)valInDollars;
-(NSUInteger)valInDollars;

-(NSDate *)dateCreated;

@end
