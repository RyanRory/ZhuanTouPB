//
//  PBRegisterDataModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/20.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBRegisterDataModel.h"

@implementation PBRegisterDataModel

static PBRegisterDataModel *instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init] ;
    }) ;
    
    return instance ;
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [PBRegisterDataModel shareInstance] ;
}

- (id)init
{
    if (self = [super init])
    {
        
    }
    
    return self;
}

- (void)setMobile:(NSString*)str
{
    mobile = str;
}

- (NSString*)getMobile
{
    return mobile;
}

- (void)setSmsCode:(NSString*)str
{
    smsCode = str;
}

- (NSString*)getSmsCode
{
    return smsCode;
}

- (void)setPassword:(NSString*)str
{
    password = str;
}

- (NSString*)getPassword
{
    return  password;
}

- (void)setVCode:(NSString*)str
{
    vCode = str;
}

- (NSString*)getVCode
{
    return vCode;
}

@end
