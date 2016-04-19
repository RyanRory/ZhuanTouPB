//
//  PBRegisterNavigationController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/19.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBRegisterNavigationController.h"

@interface PBRegisterNavigationController ()

@end

@implementation PBRegisterNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"TransparentBackground"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage imageNamed:@"TransparentBackground"]];
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.navigationBar.bounds.size.width/2-50, self.navigationBar.bounds.size.height/2-5, 100, 10)];
    [self.pageControl setNumberOfPages:3];
    [self.pageControl setCurrentPage:0];
    [self.navigationBar addSubview:self.pageControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    [self.pageControl setCurrentPage:self.pageControl.currentPage+1];
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [self.pageControl setCurrentPage:self.pageControl.currentPage-1];
    return [super popViewControllerAnimated:animated];
}


@end
