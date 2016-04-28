//
//  PBStockSourceViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/26.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStockSourceViewController.h"

@interface PBStockSourceViewController ()

@end

@implementation PBStockSourceViewController

@synthesize tView, chooseView;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [chooseView setTitle:@"您的身份是"];
    [chooseView addButtons:[NSArray arrayWithObjects:@"个人", @"机构", nil] withMarginBetween:30 withMarginSides:20];
    
    dataModel = [PBStockDataModel shareInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [tView reloadData];
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
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ConfirmCheck"] style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
    rightItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeCustom]];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftItem, item, nil];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightItem, item, nil];
}

- (void)next:(id)sender
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *URL = [BASEURL stringByAppendingString:[NSString stringWithFormat:@"api/intraday/sendStockSource"]];
    NSString *userRole;
    if ([chooseView.buttonOnlyEngine getSelectedButtonTag] == 0)
    {
        userRole = @"0";
    }
    else
    {
        userRole = @"4";
    }
    NSDictionary *parameters = @{@"userRole":userRole,
                                 @"stocks":[dataModel getStockSourceArray]};
    [manager POST:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        if ([NSString stringWithFormat:@"%@", [responseObject objectForKey:@"isSuccess"]].boolValue)
        {
            PBStockSourceCompleteViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBStockSourceCompleteViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];

}

- (void)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addStockSource:(id)sender
{
    PBStockSourceAddViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBStockSourceAddViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma DeleteButtonAction
- (void)deleteAtIndex:(UIButton*)sender
{
    [dataModel deleteStockSourceAtIndex:(int)sender.tag];
    [tView reloadData];
}

#pragma TableViewDelegate/DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([dataModel getStockSourceArray].count == 0)
    {
        return 35;
    }
    return 63;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 5;
    }
    return  0.000000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0000000001;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dataModel getStockSourceArray].count+1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == [dataModel getStockSourceArray].count)
    {
        PBStockSourceButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBStockSourceButtonTableViewCell"];
        if (!cell)
        {
            cell = [[PBStockSourceButtonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBStockSourceButtonTableViewCell"];
        }
        [cell.button addTarget:self action:@selector(addStockSource:) forControlEvents:UIControlEventTouchUpInside];
        if ([dataModel getStockSourceArray].count == 0)
        {
            [cell.button setTitle:@"添加券源" forState:UIControlStateNormal];
        }
        else
        {
            [cell.button setTitle:@"继续添加" forState:UIControlStateNormal];
        }
    
        return cell;
        
    }
    else
    {
        id data = [[dataModel getStockSourceArray] objectAtIndex:indexPath.section];
        PBStockSourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBStockSourceTableViewCell"];
        if (!cell)
        {
            cell = [[PBStockSourceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBStockSourceTableViewCell"];
        }
        cell.stockCodeNNameLabel.text = [NSString stringWithFormat:@"%@ %@", [data objectForKey:@"stockCode"], [data objectForKey:@"stockName"]];
        cell.marketValueLabel.text = [PBBaseModel formatterNumberWithDecimal:[data objectForKey:@"marketValue"]];
        cell.preTimeLabel.text = [data objectForKey:@"preTime"];
        cell.deleteButton.tag = indexPath.section;
        [cell.deleteButton addTarget:self action:@selector(deleteAtIndex:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
}

@end
