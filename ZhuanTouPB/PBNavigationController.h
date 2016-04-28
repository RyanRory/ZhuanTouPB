//
//  PBNavigationController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBNavigationController : UINavigationController

@property (strong, nonatomic) UIPageControl *pageControl;

- (void)showPageControl:(int)number;
- (void)dismissPageControl;
- (void)setPageOfPageControl:(int)page;

@end
