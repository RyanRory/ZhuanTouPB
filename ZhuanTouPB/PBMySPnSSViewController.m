//
//  PBMySPnSSViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBMySPnSSViewController.h"

@interface PBMySPnSSViewController ()

@end

@implementation PBMySPnSSViewController

@synthesize tView, titleLabel;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    if ([self.style isEqualToString:STRUCTUREDPRODUCT])
    {
        titleLabel.text = @"我的产品";
        styleColor = STRUCTUREDPRODUCTBLUE;
        SPDataModel = [PBMySPDataModel shareInstance];
        [SPDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[SPDataModel getCellObjects]];
    }
    else
    {
        titleLabel.text = @"我的券源";
        styleColor = STOCKSOURCEBLUE;
        SSDataModel = [PBMySSDataModel shareInstance];
        [SSDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[SSDataModel getCellObjects]];
    }
    self.view.backgroundColor = styleColor;
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
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
}

#pragma refreshData
- (void)refreshData
{
    if ([self.style isEqualToString:STRUCTUREDPRODUCT])
    {
        SPDataModel = [PBMySPDataModel shareInstance];
        [SPDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[SPDataModel getCellObjects]];
    }
    else
    {
        SSDataModel = [PBMySSDataModel shareInstance];
        [SSDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[SSDataModel getCellObjects]];
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
    return 107;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (section == 0)
    {
        return 0.00000000001;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == cellObjects.count-1)
    {
        return 0.00000000001;
    }
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return cellObjects.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PBMySPnSSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBMySPnSSTableViewCell"];
    if (!cell)
    {
        cell = [[PBMySPnSSTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBMySPnSSTableViewCell"];
    }
    id data = cellObjects[indexPath.section];
    if ([self.style isEqualToString:STRUCTUREDPRODUCT])
    {
        cell.titleLabel.text = @"结构化产品申请";
        cell.SSLabel1.text = @"";
        cell.SSLabel2.text = @"";
        cell.SSLabel3.text = @"";
        cell.timeLabel.text = [data objectForKey:@"time"];
        cell.statusLabel.text = [data objectForKey:@"status"];
        cell.SPLabel1.text = [NSString stringWithFormat:@"劣后规模:%@",[PBBaseModel formatterNumberWithDecimal:[data objectForKey:@"seniorAmount"]]];
        cell.SPLabel2.text = [NSString stringWithFormat:@"总金额:%@",@""];
        if ([[data objectForKey:@"statusComments"] isKindOfClass:[NSNull class]])
        {
            cell.statusNoteLabel.text = @"";
        }
        else
        {
            cell.statusNoteLabel.text = [data objectForKey:@"statusComments"];
            if ([cell.statusLabel.text isEqualToString:@"进行中"])
            {
                cell.statusNoteLabel.textColor = styleColor;
            }
        }
    }
    else
    {
        cell.titleLabel.text = @"券源申报";
        cell.SPLabel1.text = @"";
        cell.SPLabel2.text = @"";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PBProgressTrackingViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBProgressTrackingViewController"];
    vc.style = self.style;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
