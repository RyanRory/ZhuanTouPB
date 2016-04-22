//
//  PBStructuredNavigationController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/20.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBNavigationController.h"

@interface PBStructuredNavigationController : PBNavigationController<UINavigationControllerDelegate>

@property (strong, nonatomic) UIPageControl *pageControl;

@end
