//
//  PBStructuredProductDataModel.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/26.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@interface PBStructuredProductDataModel : PBBaseModel
{
    NSMutableDictionary *dic;
}

+ (instancetype)shareInstance;

- (void)set:(id)obj forKey:(NSString*)key;
- (NSMutableDictionary*)getDictionary;

@end
