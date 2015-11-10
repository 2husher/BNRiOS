//
//  AIZImageStore.m
//  ch 8 Homepwner
//
//  Created by X on 01/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZImageStore.h"

@interface AIZImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation AIZImageStore

+ (instancetype)sharedStore
{
    static AIZImageStore *sharedStore = nil;
    if (!sharedStore)
    {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use [AIZImageStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self)
    {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key)
    {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
