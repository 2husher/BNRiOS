//
//  AIZItem.h
//  ch 2 RandomItems
//
//  Created by X on 10/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIZItem : NSObject

+(instancetype)randomItem;

// Designated initializer for AIZItem
-(instancetype)initWithItemName:(NSString *)itemName
                   serialNumber:(NSString *)serialNumber
                   valInDollars:(NSInteger)valInDollars;

-(instancetype)initWithItemName:(NSString *)itemName;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) NSInteger valInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, copy) NSString *itemKey;

@end
