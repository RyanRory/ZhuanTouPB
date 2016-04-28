//
//  PBMySPDataModel.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@interface PBMySPDataModel : PBBaseModel
{
    NSArray *cellObjects;
}

+ (instancetype)shareInstance;

- (void)getDataFromServer;
- (NSArray*)getCellObjects;

@end
