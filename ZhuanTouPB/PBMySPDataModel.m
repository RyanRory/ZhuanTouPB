//
//  PBMySPDataModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBMySPDataModel.h"

@implementation PBMySPDataModel

static PBMySPDataModel *instance = nil;

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
        cellObjects = [NSArray arrayWithObjects:@{@"type":@"募集优先",@"earnestAmount":@"0.0",@"leverRatio":@"1.0",@"seniorAmount":@"2134675.0",@"expectedSeniorCost":@"66.0",@"currentTotalCost":@"0.0",@"statusComments":@"null",@"status":@"待处理",@"time":@"2016-04-30 13:33"},@{@"type":@"募集优先",@"earnestAmount":@"0.0",@"leverRatio":@"1.0",@"seniorAmount":@"2134675.0",@"expectedSeniorCost":@"66.0",@"currentTotalCost":@"0.0",@"statusComments":@"null",@"status":@"待处理",@"time":@"2016-04-30 13:33"},@{@"type":@"募集优先",@"earnestAmount":@"0.0",@"leverRatio":@"1.0",@"seniorAmount":@"2134675.0",@"expectedSeniorCost":@"66.0",@"currentTotalCost":@"0.0",@"statusComments":@"null",@"status":@"待处理",@"time":@"2016-04-30 13:33"},@{@"type":@"募集优先",@"earnestAmount":@"0.0",@"leverRatio":@"1.0",@"seniorAmount":@"2134675.0",@"expectedSeniorCost":@"66.0",@"currentTotalCost":@"0.0",@"statusComments":@"null",@"status":@"待处理",@"time":@"2016-04-30 13:33"}, nil];
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
