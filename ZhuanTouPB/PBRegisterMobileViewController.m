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

@synthesize mobileTextField, descriptionLabel;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];

    [mobileTextField setPlaceHolderText:@"请输入您的手机号码"];
    [mobileTextField setPlaceHolderChangeText:@"手机号码"];
    mobileTextField.delegate = self;
    
    dataModel = [PBRegisterDataModel shareInstance];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [mobileTextField becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    PBNavigationController *nav = (PBNavigationController*)self.navigationController;
    [nav setPageOfPageControl:0];
}

#pragma didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Navigation Function
- (void)initNavigationBar
{
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"CancelCross"] style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    leftItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
    rightItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeCustom]];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftItem, item, nil];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightItem, item, nil];
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:13], NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    PBNavigationController *nav = (PBNavigationController*)self.navigationController;
    [nav showPageControl:3];
}

- (void)next:(id)sender
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *URL = [BASEURL stringByAppendingString:[NSString stringWithFormat:@"api/auth/checkMobile/%@?vCode=%@", [self.mobileTextField getTextFieldStr], [PBBaseModel md5HexDigest:[NSString stringWithFormat:@"rujustkiddingme%@", [self.mobileTextField getTextFieldStr]]]]];
    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        if ([NSString stringWithFormat:@"%@", [responseObject objectForKey:@"isSuccess"]].boolValue)
        {
            [dataModel setMobile:[self.mobileTextField getTextFieldStr]];
            [dataModel setVCode:[PBBaseModel md5HexDigest:[NSString stringWithFormat:@"rujustkiddingme%@", [self.mobileTextField getTextFieldStr]]]];
            PBRegisterSmsCodeViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBRegisterSmsCodeViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            descriptionLabel.text = [responseObject objectForKey:@"errorMessage"];
            descriptionLabel.textColor = ERRORRED;
            [PBAnimator shakeView:self.mobileTextField.textInputView];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
