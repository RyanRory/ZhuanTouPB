//
//  PBStructuredFirstViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/20.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStructuredFirstViewController.h"

@interface PBStructuredFirstViewController ()

@end

@implementation PBStructuredFirstViewController

@synthesize chooseView1, chooseView2;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [chooseView1 setTitle:@"1、您的身份是"];
    [chooseView1 addButtons:[NSArray arrayWithObjects:@"私募机构", @"个人投资者", @"居间人", nil] withMarginBetween:12 withMarginSides:12];
    [chooseView2 setTitle:@"2、您寻求的服务是"];
    [chooseView2 addButtons:[NSArray arrayWithObjects:@"发行结构化产品", @"募集优先资金", nil] withMarginBetween:12 withMarginSides:12];
}

#pragma didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Navigation Function
- (void)initNavigationBar
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"CancelCross"] style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    leftItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NextArrow"] style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
    rightItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeCustom]];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftItem, item, nil];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightItem, item, nil];
}

- (void)next:(id)sender
{
    PBStructuredSecondViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBStructuredSecondViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
