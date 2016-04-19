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

@end
