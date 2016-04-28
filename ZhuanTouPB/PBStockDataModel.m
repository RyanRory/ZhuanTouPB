//
//  PBStockDataModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/25.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStockDataModel.h"

@implementation PBStockDataModel

static PBStockDataModel *instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init] ;
    }) ;
    
    return instance ;
}

- (void)setStocksArray:(NSArray*)array
{
    stocksArray = [NSMutableArray arrayWithArray:array];
}

- (NSArray*)getStocksArray
{
    return [NSArray arrayWithArray:stocksArray];
}

- (void)setStockSourceArray:(NSArray*)array
{
    stockSourceArray = [NSMutableArray arrayWithArray:array];
}

- (NSArray*)getStockSourceArray
{
    return stockSourceArray;
}

- (void)deleteStockSourceAtIndex:(int)index
{
    if (index < stockSourceArray.count)
    {
        [stockSourceArray removeObjectAtIndex:index];
    }
}

@end
