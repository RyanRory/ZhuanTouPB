//
//  PBRegisterSuccessViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/20.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBRegisterSuccessViewController.h"

@interface PBRegisterSuccessViewController ()

@end

@implementation PBRegisterSuccessViewController

@synthesize toDiscoverButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [toDiscoverButton addTarget:self action:@selector(toDiscover:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavigationBar
{
    PBNavigationController *nav = (PBNavigationController*)self.navigationController;
    [nav dismissPageControl];
    [self.navigationItem setHidesBackButton:YES];
}

- (void)toDiscover:(id)sender
{
    PBNavigationController *nav = [[self storyboard]instantiateViewControllerWithIdentifier:@"MainNav"];
    [self.navigationController presentViewController:nav animated:NO completion:nil];
}


@end
