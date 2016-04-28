//
//  PBStructuredProductDataModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/26.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStructuredProductDataModel.h"

@implementation PBStructuredProductDataModel

static PBStructuredProductDataModel *instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init] ;
    }) ;
    
    return instance ;
}

- (void)set:(id)obj forKey:(NSString*)key
{
    if (dic.count == 0)
    {
        dic = [[NSMutableDictionary alloc]init];
    }
    [dic setObject:obj forKey:key];
}

- (NSMutableDictionary*)getDictionary
{
    return dic;
}

@end
