//
//  PBSSDrawDataModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/5/5.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBSSDrawDataModel.h"

@implementation PBSSDrawDataModel

static PBSSDrawDataModel *instance = nil;

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
        cellObjects = [NSArray arrayWithObjects:@{@"money":@"2043.21", @"status":@"已完成", @"time":@"2016-4-25 15:30"}, @{@"money":@"2043.21", @"status":@"已完成", @"time":@"2016-4-25 15:30"}, @{@"money":@"2043.21", @"status":@"已完成", @"time":@"2016-4-25 15:30"}, @{@"money":@"2043.21", @"status":@"已完成", @"time":@"2016-4-25 15:30"}, @{@"money":@"2043.21", @"status":@"已完成", @"time":@"2016-4-25 15:30"}, @{@"money":@"2043.21", @"status":@"已完成", @"time":@"2016-4-25 15:30"}, @{@"money":@"2043.21", @"status":@"已完成", @"time":@"2016-4-25 15:30"}, nil];
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
