//
//  PBBlanceViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBlanceViewController.h"

@interface PBBlanceViewController ()

@end

@implementation PBBlanceViewController

@synthesize tView, toChargeButton, balanceLabel;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [toChargeButton addTarget:self action:@selector(toCharge:) forControlEvents:UIControlEventTouchUpInside];
    
    dataModel = [PBBalanceDataModel shareInstance];
    
    balanceLabel.text = [PBBaseModel formatterNumberWithDecimal:[dataModel getBalance]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    PBNavigationController *nav = (PBNavigationController*)self.navigationController;
    [nav dismissPageControl];
}

#pragma Navigation Function
- (void)initNavigationBar
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"BackArrow"] style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    leftItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeCustom]];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftItem, item, nil];
}
- (void)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma refreshData
- (void)refreshData
{
    balanceLabel.text = [PBBaseModel formatterNumberWithDecimal:[dataModel getBalance]];
    [tView reloadData];
}

#pragma ServerError
- (void)showError
{
    
}

#pragma didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma buttonAction
- (void)toCharge:(id)sender
{
    
}

#pragma TableViewDelegate/DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 10;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dataModel getCellObjects].count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PBBalanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBBalanceTableViewCell"];
    if (!cell)
    {
        cell = [[PBBalanceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBBalanceTableViewCell"];
    }
    id data = [dataModel getCellObjects][indexPath.section];
    
    cell.titleLabel.text = [data objectForKey:@"title"];
    cell.progressLabel.text = [data objectForKey:@"progress"];
    cell.timeLabel.text = [data objectForKey:@"time"];
    cell.amountLabel.text = [PBBaseModel formatterNumberWithDecimal:[data objectForKey:@"amount"]];
    
    return cell;
}

@end
