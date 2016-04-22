//
//  PBStructuredSecondViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/21.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStructuredSecondViewController.h"

@interface PBStructuredSecondViewController ()

@end

@implementation PBStructuredSecondViewController

@synthesize posteriorTextField, chooseView;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [posteriorTextField setPlaceHolderText:@"请输入您的劣后资金"];
    [posteriorTextField setPlaceHolderChangeText:@"劣后资金(元)"];
    [posteriorTextField setNumberFomatterEntry:YES];
    posteriorTextField.delegate = self;
    
    [chooseView setTitle:@"选择杠杆比例 [优先:劣后] (单选)"];
    [chooseView addButtons:[NSArray arrayWithObjects:@"1 : 1", @"2 : 1", @"3 : 1", @"其他", nil] withMarginBetween:10 withMarginSides:3];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [posteriorTextField becomeFirstResponder];
}

#pragma didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Navigation Function
- (void)initNavigationBar
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"BackArrow"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    leftItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NextArrow"] style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
    rightItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeCustom]];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftItem, item, nil];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightItem, item, nil];
}

- (void)next:(id)sender
{
    PBStructuredThirdViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBStructuredThirdViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //返回一个BOOL值，指明是否允许在按下回车键时结束编辑
    //如果允许要调用resignFirstResponder 方法，这回导致结束编辑，而键盘会被收起
    [self next:nil];
    return YES;
}

@end
