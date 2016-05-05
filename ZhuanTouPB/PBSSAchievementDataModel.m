//
//  PBSSACHIEVEMENTDataModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/5/5.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBSSAchievementDataModel.h"

@implementation PBSSAchievementDataModel

static PBSSAchievementDataModel *instance = nil;

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
        cellObjects = [NSArray arrayWithObjects:@{@"title":@"我是标题", @"content":@"我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容", @"time":@"2016-4-25 15:30"}, @{@"title":@"我是标题", @"content":@"我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容", @"time":@"2016-4-25 15:30"}, @{@"title":@"我是标题", @"content":@"我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容", @"time":@"2016-4-25 15:30"}, @{@"title":@"我是标题", @"content":@"我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容，我是内容", @"time":@"2016-4-25 15:30"},  nil];
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
