//
//  PBBaseViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"

@interface PBBaseViewController ()

@end

@implementation PBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshData) name:@"Refresh" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showError) name:@"ShowError" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Refresh" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ShowError" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma refreshData
- (void)refreshData
{
    
}

#pragma ServerError
- (void)showError
{
    
}


@end
