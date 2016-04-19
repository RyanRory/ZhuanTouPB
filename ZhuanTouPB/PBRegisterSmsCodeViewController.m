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

@synthesize placeholderLabel, smsCodeTextField, descriptionLabel, errorLabel, smsCodeButton;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [smsCodeTextField addTarget:self action:@selector(editingChanged:) forControlEvents:UIControlEventEditingChanged];
    smsCodeTextField.delegate = self;
    
    [smsCodeButton addTarget:self action:@selector(clickSmsCode:) forControlEvents:UIControlEventTouchUpInside];
    
    lastLength = 0;
    
    //进入页面自动发送验证码
    [self sendSmsCode:NO];
    [smsCodeButton setUserInteractionEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
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

#pragma TextField Function
- (void)shouldLabelAnimated:(UILabel*)sender textField:(UITextField*)textField
{
    if (textField.text.length == 1 && lastLength == 0)
    {
        sender.text = @"手机验证码";
        [PBAnimator labelAnimation:YES label:placeholderLabel];
    }
    if (textField.text.length == 0 && lastLength == 1)
    {
        sender.text= @"请输入您收到的手机验证码";
        [PBAnimator labelAnimation:NO label:placeholderLabel];
    }
    lastLength = textField.text.length;
}

- (void)editingChanged:(UITextField*)sender
{
    [self shouldLabelAnimated:placeholderLabel textField:sender];
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
