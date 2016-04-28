//
//  PBBalanceDataModel.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@interface PBBalanceDataModel : PBBaseModel
{
    NSArray *cellObjects;
    NSString *balance;
}

+ (instancetype)shareInstance;

- (void)setBalance:(NSString*)str;
- (NSString*)getBalance;
- (NSArray*)getCellObjects;
- (void)getDataFromServer;

@end
