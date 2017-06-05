//
//  TestDemo.h
//  MPUserDefaults
//
//  Created by Liuguiliang on 2017/6/5.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "MPUserDefaults.h"

@interface TestDemo : MPUserDefaults

@property (copy, nonatomic)NSString *userName;

@property (copy, nonatomic)NSString *userID;

@property (copy, nonatomic)NSString *version;

@property (assign, nonatomic)BOOL firstTimeLogin;



@end
