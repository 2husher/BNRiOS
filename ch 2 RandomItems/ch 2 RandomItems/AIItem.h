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
    NSInteger _valInDollars;
    NSDate *_dateCreated;
}

+(instancetype)randomItem;

// Designated initializer for AIItem
-(instancetype)initWithItemName:(NSString *)itemName
                   serialNumber:(NSString *)serialNumber
                   valInDollars:(NSInteger)valInDollars;

-(instancetype)initWIthItemName:(NSString *)itemName;

-(void)setItemName:(NSString *)itemName;
-(NSString *)itemName;

-(void)setSerialNumber:(NSString *)serialNumber;
-(NSString *)serialNumber;

-(void)setValInDollars:(NSInteger)valInDollars;
-(NSInteger)valInDollars;

-(NSDate *)dateCreated;

@end
