//
//  PBLoginPasswordViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBLoginPasswordViewController.h"

@interface PBLoginPasswordViewController ()

@end

@implementation PBLoginPasswordViewController

@synthesize passwordTextField, descriptionLabel, secureEntryButton;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [passwordTextField setPlaceHolderText:@"请输入您的登录密码"];
    [passwordTextField setPlaceHolderChangeText:@"登录密码"];
    [passwordTextField setSecureTextEntry:YES];
    passwordTextField.delegate = self;
    
    secureEntryButton.selected = YES;
    [secureEntryButton addTarget:self action:@selector(isSecureTextEntry:) forControlEvents:UIControlEventTouchUpInside];
    
    dataModel = [PBLoginDataModel shareInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [passwordTextField becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    PBNavigationController *nav = (PBNavigationController*)self.navigationController;
    [nav setPageOfPageControl:1];
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
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
    rightItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeCustom]];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftItem, item, nil];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightItem, item, nil];
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:13], NSFontAttributeName,nil] forState:UIControlStateNormal];
}

- (void)next:(id)sender
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *URL = [BASEURL stringByAppendingString:[NSString stringWithFormat:@"api/auth/signIn"]];
    NSDictionary *parameters = @{@"login":[dataModel getMobile],
                                 @"password":[self.passwordTextField getTextFieldStr]};
    [manager POST:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        if ([NSString stringWithFormat:@"%@", [responseObject objectForKey:@"isAuthenticated"]].boolValue)
        {
            [dataModel setPassword:[self.passwordTextField getTextFieldStr]];
            
            PBNavigationController *nav = [[self storyboard]instantiateViewControllerWithIdentifier:@"MainNav"];
            [self.navigationController presentViewController:nav animated:NO completion:nil];
        }
        else
        {
            descriptionLabel.text = [NSString stringWithFormat:@"%@", [responseObject objectForKey:@"errorMessage"]];
            descriptionLabel.textColor = ERRORRED;
            [PBAnimator shakeView:self.passwordTextField.textInputView];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
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
