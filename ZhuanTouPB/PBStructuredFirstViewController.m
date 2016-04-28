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
    
    dataModel = [PBStructuredProductDataModel shareInstance];
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
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"BackArrow"] style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
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
    NSString *userRole, *structuringType;
    switch ([chooseView1.buttonOnlyEngine getSelectedButtonTag]) {
        case 0:
            userRole = @"2";
            break;
        case 1:
            userRole = @"0";
            break;
        case 2:
            userRole = @"1";
            break;
            
        default:
            break;
    }
    structuringType = [NSString stringWithFormat:@"%d", [chooseView2.buttonOnlyEngine getSelectedButtonTag]];
    [dataModel set:userRole forKey:@"UserRole"];
    [dataModel set:structuringType forKey:@"StructuringType"];
    PBStructuredSecondViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBStructuredSecondViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
