//
//  PBLoginDataModel.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/26.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@interface PBLoginDataModel : PBBaseModel
{
    NSString *mobile, *password;
}

+ (instancetype)shareInstance;

- (void)setMobile:(NSString*)str;
- (NSString*)getMobile;
- (void)setPassword:(NSString*)str;
- (NSString*)getPassword;

@end
