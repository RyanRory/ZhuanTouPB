//
//  PBStructuredNavigationController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/20.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStructuredNavigationController.h"

@interface PBStructuredNavigationController ()

@end

@implementation PBStructuredNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.navigationBar.bounds.size.width/2-50, self.navigationBar.bounds.size.height/2-8, 100, 10)];
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
    if (self.pageControl.currentPage+1 <= self.pageControl.numberOfPages)
    {
        [self.pageControl setCurrentPage:self.pageControl.currentPage+1];
    }
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [self.pageControl setCurrentPage:self.pageControl.currentPage-1];
    return [super popViewControllerAnimated:animated];
}

@end
