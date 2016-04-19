//
//  PBRegisterMobileViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBRegisterMobileViewController.h"

@interface PBRegisterMobileViewController ()

@end

@implementation PBRegisterMobileViewController

@synthesize placeholderLabel, mobileTextField, descriptionLabel;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initNavigationBar];

    [mobileTextField addTarget:self action:@selector(editingChanged:) forControlEvents:UIControlEventEditingChanged];
    mobileTextField.delegate = self;
    
    lastLength = 0;
}

- (void)viewWillAppear:(BOOL)animated
{
    [mobileTextField becomeFirstResponder];
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
    PBRegisterSmsCodeViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBRegisterSmsCodeViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma TextField Function
- (void)shouldLabelAnimated:(UILabel*)sender textField:(UITextField*)textField
{
    if (textField.text.length == 1 && lastLength == 0)
    {
        sender.text = @"手机号码";
        [PBAnimator labelAnimation:YES label:placeholderLabel];
    }
    if (textField.text.length == 0 && lastLength == 1)
    {
        sender.text= @"请输入您的手机号码";
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
