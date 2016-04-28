//
//  PBDiscoverDataModel.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/27.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@interface PBDiscoverDataModel : PBBaseModel
{
    NSArray *cellObjects, *serviceDescs, *banners;
}

+ (instancetype)shareInstance;

- (void)getDataFromServer;
- (NSArray*)getBanners;
- (NSArray*)getCellObjects;
- (NSArray*)getServiceDescs;

@end
