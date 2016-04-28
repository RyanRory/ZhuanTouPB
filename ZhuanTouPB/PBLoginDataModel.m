//
//  PBLoginDataModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/26.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBLoginDataModel.h"

@implementation PBLoginDataModel

static PBLoginDataModel *instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init] ;
    }) ;
    
    return instance ;
}
- (void)setMobile:(NSString*)str
{
    mobile = str;
}

- (NSString*)getMobile
{
    return mobile;
}
- (void)setPassword:(NSString*)str
{
    password = str;
}

- (NSString*)getPassword
{
    return  password;
}

@end
