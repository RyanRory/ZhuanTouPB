//
//  PBRegisterPasswordViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBRegisterPasswordViewController.h"

@interface PBRegisterPasswordViewController ()

@end

@implementation PBRegisterPasswordViewController

@synthesize passwordTextField, descriptionLabel, secureEntryButton;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [passwordTextField setPlaceHolderText:@"请设置您的登录密码"];
    [passwordTextField setPlaceHolderChangeText:@"登录密码"];
    [passwordTextField setSecureTextEntry:YES];
    passwordTextField.delegate = self;
    
    secureEntryButton.selected = YES;
    [secureEntryButton addTarget:self action:@selector(isSecureTextEntry:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [passwordTextField becomeFirstResponder];
}

#pragma didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma SecureEntryButtonAction
- (void)isSecureTextEntry:(UIButton*)sender
{
    sender.selected = !sender.selected;
    [passwordTextField setSecureTextEntry:sender.selected];
    //实现textfield安全输入和正常输入的文字转换
    if (sender.selected)
    {
        [sender setImage:[UIImage imageNamed:@"EyeClose"] forState:UIControlStateNormal];
    }
    else
    {
        [sender setImage:[UIImage imageNamed:@"EyeOpen"] forState:UIControlStateNormal];
    }
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
    PBRegisterSuccessViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBRegisterSuccessViewController"];
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
