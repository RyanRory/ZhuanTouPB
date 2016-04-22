//
//  PBBaseModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@implementation PBBaseModel

+ (BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController
{
    return (viewController.isViewLoaded && viewController.view.window);
}

+ (NSString*)formatterNumberWithoutDecimal:(NSNumber*)number
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setPositiveFormat:@"###,##0"];
    return [formatter stringFromNumber:number];
}

+ (NSString*)formatterNumberWithDecimal:(NSNumber*)number
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setPositiveFormat:@"###,##0.00"];
    return [formatter stringFromNumber:number];
}
@end
