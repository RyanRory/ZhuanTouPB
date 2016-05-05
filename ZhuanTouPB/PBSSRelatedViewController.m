//
//  PBSSRelatedViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/5/5.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBSSRelatedViewController.h"

@interface PBSSRelatedViewController ()

@end

@implementation PBSSRelatedViewController

@synthesize tView, titleLabel;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    if ([self.style isEqualToString:SSACHIEVEMENT])
    {
        titleLabel.text = @"业绩报告";
        AchievementDataModel = [PBSSAchievementDataModel shareInstance];
        [AchievementDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[AchievementDataModel getCellObjects]];
    }
    else
    {
        titleLabel.text = @"提盈记录";
        DrawDataModel = [PBSSDrawDataModel shareInstance];
        [DrawDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[DrawDataModel getCellObjects]];
    }
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
    if ([self.style isEqualToString:SSACHIEVEMENT])
    {
        AchievementDataModel = [PBSSAchievementDataModel shareInstance];
        [AchievementDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[AchievementDataModel getCellObjects]];
    }
    else
    {
        DrawDataModel = [PBSSDrawDataModel shareInstance];
        [DrawDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[DrawDataModel getCellObjects]];
    }
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

#pragma TableViewDelegate/DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.style isEqualToString:SSACHIEVEMENT])
    {
        PBSSAchievementTableViewCell *cell = (PBSSAchievementTableViewCell*)[self tableView: tView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height;
    }
    else
    {
        return 64;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.00000000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00000000001;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellObjects.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.style isEqualToString:SSACHIEVEMENT])
    {
        PBSSAchievementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBSSAchievementTableViewCell"];
        if (!cell)
        {
            cell = [[PBSSAchievementTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBSSAchievementTableViewCell"];
        }
        
        id data = [cellObjects objectAtIndex:indexPath.row];
        
        cell.titleLabel.text = [data objectForKey:@"title"];
        [cell setContentText:[data objectForKey:@"content"]];
        cell.timeLabel.text = [data objectForKey:@"time"];
        
        return cell;
    }
    else
    {
        PBSSDrawTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBSSDrawTableViewCell"];
        if (!cell)
        {
            cell = [[PBSSDrawTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBSSDrawTableViewCell"];
        }
        id data = [cellObjects objectAtIndex:indexPath.row];
        
        cell.amountLabel.text = [data objectForKey:@"money"];
        cell.timeLabel.text = [data objectForKey:@"time"];
        cell.statusLabel.text = [data objectForKey:@"status"];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
