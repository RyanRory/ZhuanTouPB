//
//  PBStockDataModel.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/25.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@interface PBStockDataModel : PBBaseModel
{
    NSMutableArray *stocksArray, *stockSourceArray;
}

+ (instancetype)shareInstance;

- (void)setStocksArray:(NSArray*)array;
- (NSArray*)getStocksArray;
- (void)setStockSourceArray:(NSArray*)array;
- (NSArray*)getStockSourceArray;
- (void)deleteStockSourceAtIndex:(int)index;

@end
