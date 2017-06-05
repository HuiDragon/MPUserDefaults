//
//  MPUserDefaults.m
//  MPUserDefaults
//
//  Created by MapleLeaf on 2016/6/5.
//  Copyright © 2016年 HuiDragon. All rights reserved.
//

#import "MPUserDefaults.h"
#import <objc/runtime.h>


@interface MPUserDefaults ()

@property (nonatomic, strong) NSMutableArray *instanceNames;

@end

@implementation MPUserDefaults

static MPUserDefaults *_userDefaults = nil;

+ (instancetype)standardUserDefaults {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _userDefaults = [[self alloc] init];
        [_userDefaults setupUserDefaults];
    });
    return _userDefaults;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _userDefaults = [super allocWithZone:zone];
    });
    
    return _userDefaults;}

- (id)copyWithZone:(NSZone *)zone {
    return _userDefaults;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _userDefaults;
}

- (void)dealloc {
    
    [self.instanceNames enumerateObjectsUsingBlock:^(NSString * key, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeObserver:self forKeyPath:key];
    }];
}

- (void)setupUserDefaults {

    //Get all property
    unsigned outCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (NSInteger i = 0; i < outCount; i ++) {
        
        objc_property_t property = properties[i];
        
        NSString *propertyName = [NSString stringWithFormat:@"%s",property_getName(property)];
        
        id value = [[NSUserDefaults standardUserDefaults] valueForKey:propertyName];
        if (value) {
            [self setValue:value forKey:propertyName];
        }
        
        //add KVO
        [self addObserver:self forKeyPath:propertyName options:NSKeyValueObservingOptionNew context:nil];
        
        //添加到数组中
        if (propertyName) {
            [self.instanceNames addObject:propertyName];
        }
        
    }
    
}

#pragma makr - KVO method
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    id value = [self valueForKey:keyPath];
    [userDefaults setValue:value forKey:keyPath];
    [userDefaults synchronize];
}


@end
