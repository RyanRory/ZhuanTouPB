//
//  PBRegisterDataModel.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/20.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@interface PBRegisterDataModel : PBBaseModel
{
    NSString *mobile, *smsCode, *password;
}

+ (instancetype)shareInstance;
+ (id)allocWithZone:(struct _NSZone *)zone;

- (void)setMobile:(NSString*)str;
- (NSString*)getMobile;
- (void)setSmsCode:(NSString*)str;
- (NSString*)getSmsCode;
- (void)setPassword:(NSString*)str;
- (NSString*)getPassword;

@end
