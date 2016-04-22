//
//  PBStructuredThirdViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/21.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStructuredThirdViewController.h"

@interface PBStructuredThirdViewController ()

@end

@implementation PBStructuredThirdViewController

@synthesize tView, confirmButton;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    data = [NSMutableArray arrayWithObjects:@"期货趋势交易", @"期货跨期、同类跨品种套利", @"股指、国债、贵金属期现套利", @"股票对冲策略(Alpha)", @"股票投机", @"上证50ETF期权相关交易", @"债券策略(包括交易所债券、国债期货、分期A)", @"QDII相关策略", @"其他", nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeCustom]];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftItem, item, nil];
}

- (void)next:(id)sender
{
    
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

#pragma TableViewDelegate/DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == data.count+1)
    {
        return 60;
    }
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 25;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == data.count+1)
    {
        return 0;
    }
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return data.count+2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        PBStructuredTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBStructuredTitleTableViewCell"];
        if (!cell)
        {
            cell = [[PBStructuredTitleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBStructuredTitleTableViewCell"];
        }
        cell.titleLabel.text = @"您的交易策略(多选)";
        
        return cell;
    }
    else if (indexPath.section == data.count+1)
    {
        PBStructuredInputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBStructuredInputTableViewCell"];
        if (!cell)
        {
            cell = [[PBStructuredInputTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBStructuredInputTableViewCell"];
        }
        cell.textField.delegate = self;
        [cell.textField setPlaceHolderText:@"您期待的优先级资金成本是"];
        [cell.textField setPlaceHolderChangeText:@"优先级资金成本"];
        
        return cell;
    }
    else
    {
        PBStructuredOptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBStructuredOptionTableViewCell"];
        if (!cell)
        {
            cell = [[PBStructuredOptionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBStructuredOptionTableViewCell"];
        }
        cell.checkboxImage.image = [UIImage imageNamed:@"CancelCross"];
        cell.contentLabel.text = [NSString stringWithFormat:@"%@",[data objectAtIndex:indexPath.section-1]];
        [cell setIsSelected:NO];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section != 0 && indexPath.section != data.count+1)
    {
        PBStructuredOptionTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (![cell isSelectedOrNot])
        {
            [cell setIsSelected:YES];
            cell.checkboxImage.image = [UIImage imageNamed:@"BackArrow"];
        }
        else
        {
            [cell setIsSelected:NO];
            cell.checkboxImage.image = [UIImage imageNamed:@"CancelCross"];
        }
    }
}

@end
