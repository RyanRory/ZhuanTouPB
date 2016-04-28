//
//  PBSPProgressDataModel.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@interface PBSPProgressDataModel : PBBaseModel
{
    NSArray *cellObjects;
}

+ (instancetype)shareInstance;

- (void)getDataFromServer;
- (NSArray*)getCellObjects;

@end
