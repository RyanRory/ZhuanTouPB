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

@synthesize placeholderLabel, passwordTextField, descriptionLabel, secureEntryButton;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [passwordTextField addTarget:self action:@selector(editingChanged:) forControlEvents:UIControlEventEditingChanged];
    passwordTextField.delegate = self;
    
    lastLength = 0;
    passwordTextFieldStr = @"";
    isSecureTextEntry = YES;
    secureEntryButton.selected = YES;
    [secureEntryButton addTarget:self action:@selector(isSecureTextEntry:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated
{
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
    isSecureTextEntry = sender.selected;
    //实现textfield安全输入和正常输入的文字转换
    if (sender.selected)
    {
        [sender setImage:[UIImage imageNamed:@"EyeClose"] forState:UIControlStateNormal];
        if (passwordTextField.text.length > 0)
        {
            passwordTextField.text = @"";
            for (int i=0; i<passwordTextFieldStr.length; i++)
            {
                passwordTextField.text = [passwordTextField.text stringByAppendingString:@"*"];
            }
        }
    }
    else
    {
        [sender setImage:[UIImage imageNamed:@"EyeOpen"] forState:UIControlStateNormal];
        passwordTextField.text = passwordTextFieldStr;
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
        sender.text = @"登录密码";
        [PBAnimator labelAnimation:YES label:placeholderLabel];
    }
    if (textField.text.length == 0 && lastLength == 1)
    {
        sender.text= @"请设置您的登录密码";
        [PBAnimator labelAnimation:NO label:placeholderLabel];
    }
    lastLength = textField.text.length;
}

- (void)editingChanged:(UITextField*)sender
{
    //实现textfield安全输入，记录textfield实际文字
    if (sender.text.length > lastLength)
    {
        if (isSecureTextEntry && lastLength > 0)
        {
            passwordTextField.text = [passwordTextField.text stringByReplacingCharactersInRange:NSMakeRange(lastLength-1, 1) withString:@"*"];
        }
        passwordTextFieldStr = [passwordTextFieldStr stringByAppendingString:[passwordTextField.text substringWithRange:NSMakeRange(lastLength, 1)]];
    }
    else
    {
        passwordTextFieldStr = [passwordTextFieldStr substringWithRange:NSMakeRange(0, passwordTextField.text.length)];
    }
    
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
