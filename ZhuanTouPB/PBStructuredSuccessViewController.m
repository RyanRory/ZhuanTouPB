//
//  PBStructuredSuccessViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStructuredSuccessViewController.h"

@interface PBStructuredSuccessViewController ()

@end

@implementation PBStructuredSuccessViewController

@synthesize checkScheduleButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [checkScheduleButton addTarget:self action:@selector(checkSchedule:) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Navigation Function
- (void)initNavigationBar
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"CancelCross"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    leftItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeCustom]];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftItem, item, nil];
    
    PBNavigationController *nav = (PBNavigationController*)self.navigationController;
    [nav dismissPageControl];
}

- (void)back:(id)sender
{
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
}

#pragma ButtonAction
- (void)checkSchedule:(id)sender
{
    PBMySPnSSViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBMySPnSSViewController"];
    vc.style = STRUCTUREDPRODUCT;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
