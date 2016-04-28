//
//  PBUserCenterViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/27.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBUserCenterViewController.h"

@interface PBUserCenterViewController ()

@end

@implementation PBUserCenterViewController

@synthesize tView, toDiscoverButton;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    cellObjects = [NSMutableArray arrayWithObjects:@"申报结构化产品", @"我的产品", @"申报券源", @"我的券源", @"绑定银行卡", nil];
    
    [toDiscoverButton addTarget:self action:@selector(toDiscover:) forControlEvents:UIControlEventTouchDown];
    
    dataModel = [PBUserCenterDataModel shareInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [dataModel getDataFromServer];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    PBNavigationController *nav = (PBNavigationController*)self.navigationController;
    [nav dismissPageControl];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma refreshData
- (void)refreshData
{
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

#pragma Cells&CellButton Actions
- (void)toDiscover:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)toBalance:(id)sender
{
    PBBlanceViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBBlanceViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)declareStructuredProduct
{
    PBStructuredFirstViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBStructuredFirstViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)myStructuredProduct
{
    PBMySPnSSViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBMySPnSSViewController"];
    vc.style = STRUCTUREDPRODUCT;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)declareStockSource
{
    PBStockSourceViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBStockSourceViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)myStockSource
{
    PBMySPnSSViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBMySPnSSViewController"];
    vc.style = STOCKSOURCE;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)addBankCard
{
    
}

#pragma TableViewDelegate/DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 214.0*SCREEN_WIDTH/320+50;
    }
    return 46 < (SCREEN_HEIGHT-(214.0*SCREEN_WIDTH/320+50)-104)/5 ? 46:(SCREEN_HEIGHT-(214.0*SCREEN_WIDTH/320+50)-104)/5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0.00000001;
    }
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3)
    {
        return 0.0000000001;
    }
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1 || section == 2)
    {
        return 2;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        PBUserCenterTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBUserCenterTopTableViewCell"];
        if (!cell)
        {
            cell = [[PBUserCenterTopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBUserCenterTopTableViewCell"];
        }
        [cell.toBalanceButton addTarget:self action:@selector(toBalance:) forControlEvents:UIControlEventTouchUpInside];
        cell.balanceLabel.text = [PBBaseModel formatterNumberWithDecimal:[dataModel getBalance]];
        cell.profitLabel.text = [PBBaseModel formatterNumberWithDecimal:[dataModel getTotalAmount]];
        
        return cell;
    }
    else
    {
        PBUserCenterLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBUserCenterLabelTableViewCell"];
        if (!cell)
        {
            cell = [[PBUserCenterLabelTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBUserCenterLabelTableViewCell"];
        }
        cell.titleLabel.text = cellObjects[(indexPath.section-1)*2+indexPath.row];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            [self declareStructuredProduct];
        }
        else
        {
            [self myStructuredProduct];
        }
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            [self declareStockSource];
        }
        else
        {
            [self myStockSource];
        }
    }
    else if (indexPath.section == 3)
    {
        [self addBankCard];
    }
    
}


@end
