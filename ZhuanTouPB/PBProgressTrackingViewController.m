//
//  PBProgressTrackingViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBProgressTrackingViewController.h"

@interface PBProgressTrackingViewController ()

@end

@implementation PBProgressTrackingViewController

@synthesize tView, navigationBarView;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    if ([self.style isEqualToString:STRUCTUREDPRODUCT])
    {
        SPDataModel = [PBSPProgressDataModel shareInstance];
        [SPDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[SPDataModel getCellObjects]];
        styleColor = STRUCTUREDPRODUCTBLUE;
    }
    else
    {
        SSDataModel = [PBSSProgressDataModel shareInstance];
        [SSDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[SSDataModel getCellObjects]];
        styleColor = STOCKSOURCEBLUE;
    }
    navigationBarView.backgroundColor = styleColor;
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
    if ([self.style isEqualToString:STRUCTUREDPRODUCT])
    {
        SPDataModel = [PBSPProgressDataModel shareInstance];
        [SPDataModel getDataFromServer];
        cellObjects = [NSArray arrayWithArray:[SPDataModel getCellObjects]];
    }
    else
    {
        SSDataModel = [PBSSProgressDataModel shareInstance];
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
    return (SCREEN_HEIGHT-64)/cellObjects.count;
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
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return cellObjects.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PBProgressTrackingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBProgressTrackingTableViewCell"];
    if (!cell)
    {
        cell = [[PBProgressTrackingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBProgressTrackingTableViewCell"];
    }
    id data = cellObjects[indexPath.section];
    cell.titleLabel.text = [data objectForKey:@"title"];
    cell.timeLabel.text = [data objectForKey:@"time"];
    cell.descriptionLabel.text = [data objectForKey:@"desc"];
    cell.statusLabel.text = [data objectForKey:@"status"];
    if (indexPath.section == 0)
    {
        cell.topLine.hidden = YES;
    }
    if (indexPath.section == cellObjects.count-1)
    {
        cell.bottomLine.hidden = YES;
    }
    
    if ([cell.statusLabel.text isEqualToString:@"已完成"])
    {
        if ([self.style isEqualToString:STRUCTUREDPRODUCT])
        {
            cell.circleImage.image = [UIImage imageNamed:@"SPCompletedCircle"];
            cell.bgImage.image = [UIImage imageNamed:@"SPProgressBG"];
        }
        else
        {
            cell.circleImage.image = [UIImage imageNamed:@"SSCompletedCircle"];
            cell.bgImage.image = [UIImage imageNamed:@"SSProgressBG"];
        }
        
        cell.topLine.backgroundColor = styleColor;
        cell.bottomLine.backgroundColor = styleColor;
    }
    else if ([cell.statusLabel.text isEqualToString:@"进行中"])
    {
        if ([self.style isEqualToString:STRUCTUREDPRODUCT])
        {
            cell.circleImage.image = [UIImage imageNamed:@"SPIngCircle"];
            cell.bgImage.image = [UIImage imageNamed:@"SPProgressBG"];
        }
        else
        {
            cell.circleImage.image = [UIImage imageNamed:@"SSIngCircle"];
            cell.bgImage.image = [UIImage imageNamed:@"SSProgressBG"];
        }
        
        cell.topLine.backgroundColor = styleColor;
        cell.bottomLine.backgroundColor = styleColor;
    }
    else
    {
        cell.circleImage.image = [UIImage imageNamed:@"UnstartedCircle"];
        cell.bgImage.image = [UIImage imageNamed:@"UnstartedProgressBG"];
        
        cell.topLine.backgroundColor = [UIColor lightGrayColor];
        cell.bottomLine.backgroundColor = [UIColor lightGrayColor];
    }
    
    if (indexPath.section+1 < cellObjects.count && [[cellObjects[indexPath.section+1] objectForKey:@"status"] isEqualToString:@"未开始"])
    {
        cell.bottomLine.backgroundColor = [UIColor lightGrayColor];
    }
    
    
    return cell;
}

@end
