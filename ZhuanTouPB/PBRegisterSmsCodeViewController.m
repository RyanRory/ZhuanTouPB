//
//  PBRegisterSmsCodeViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBRegisterSmsCodeViewController.h"

@interface PBRegisterSmsCodeViewController ()

@end

@implementation PBRegisterSmsCodeViewController

@synthesize smsCodeTextField, descriptionLabel, errorLabel, smsCodeButton;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [smsCodeTextField setPlaceHolderText:@"请输入您收到的验证码"];
    [smsCodeTextField setPlaceHolderChangeText:@"验证码"];
    smsCodeTextField.delegate = self;
    
    [smsCodeButton addTarget:self action:@selector(clickSmsCode:) forControlEvents:UIControlEventTouchUpInside];
    
    //进入页面自动发送验证码
    [self sendSmsCode:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [smsCodeTextField becomeFirstResponder];
}

#pragma timer事件
- (void)timeFireMethod
{
    secondsCountDown--;
    if (secondsCountDown == 0)
    {
        smsCodeButton.titleLabel.text = @"语音验证码";
        [smsCodeButton setTitle:@"语音验证码" forState:UIControlStateNormal];
        [smsCodeButton setUserInteractionEnabled:YES];
        [timer invalidate];
    }
    else
    {
        smsCodeButton.titleLabel.text = [NSString stringWithFormat:@"%ds",secondsCountDown];
        [smsCodeButton setTitle:[NSString stringWithFormat:@"%ds",secondsCountDown] forState:UIControlStateNormal];
    }
}

#pragma SmsCodeButtonAction
- (void)clickSmsCode:(id)button
{
    [self sendSmsCode:YES];
}

- (void)sendSmsCode:(BOOL)flag
{
    secondsCountDown = 60;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    [smsCodeButton setUserInteractionEnabled:NO];
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
    PBRegisterPasswordViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBRegisterPasswordViewController"];
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
