//
//  PBMySSDataModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBMySSDataModel.h"

@implementation PBMySSDataModel

static PBMySSDataModel *instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init] ;
    }) ;
    
    return instance ;
}

- (instancetype)init
{
    if (self = [super init])
    {
        cellObjects = [NSArray arrayWithObjects:@{@"mode":@"年化6%", @"cycle":@"每月", @"status":@"与投顾协商 进行中", @"time":@"2016-4-25 15:30", @"achievementAmount":@"200000", @"achievementTime":@"2016-4-25 15:30", @"stocks":[NSArray arrayWithObjects:@{@"code":@"600619",@"name":@"复星医药",@"amount":@"19988",@"profit":@"787878"},@{@"code":@"600619",@"name":@"复星医药",@"amount":@"19988",@"profit":@"787878"},@{@"code":@"600619",@"name":@"复星医药",@"amount":@"19988",@"profit":@"787878"},nil]},@{@"mode":@"年化6%", @"cycle":@"每月", @"status":@"与投顾协商 进行中", @"time":@"2016-4-25 15:30", @"achievementAmount":@"200000", @"achievementTime":@"2016-4-25 15:30", @"stocks":[NSArray arrayWithObjects:@{@"code":@"600619",@"name":@"复星医药",@"amount":@"19988",@"profit":@"787878"},@{@"code":@"600619",@"name":@"复星医药",@"amount":@"19988",@"profit":@"787878"},nil]},@{@"mode":@"年化6%", @"cycle":@"每月", @"status":@"与投顾协商 进行中", @"time":@"2016-4-25 15:30", @"achievementAmount":@"200000", @"achievementTime":@"2016-4-25 15:30", @"stocks":[NSArray arrayWithObjects:@{@"code":@"600619",@"name":@"复星医药",@"amount":@"19988",@"profit":@"787878"},nil]}, nil];
    }
    
    return self;
}

- (void)getDataFromServer
{
    
}

- (NSArray*)getCellObjects
{
    return cellObjects;
}

@end
