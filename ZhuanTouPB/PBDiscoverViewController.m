//
//  PBDiscoverViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/27.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBDiscoverViewController.h"

@interface PBDiscoverViewController ()

@end

@implementation PBDiscoverViewController

@synthesize tView, toUserCenterButton;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [toUserCenterButton addTarget:self action:@selector(toUserCenter:) forControlEvents:UIControlEventTouchDown];
    
    dataModel = [PBDiscoverDataModel shareInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [dataModel getDataFromServer];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
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
- (void)toUserCenter:(id)sender
{
    PBUserCenterViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBUserCenterViewController"];
    [self.navigationController pushViewController:vc animated:NO];
}

#pragma TableViewDelegate/DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 200.0*SCREEN_WIDTH/320;
    }
    if (indexPath.row == 1 || indexPath.row == 2)
    {
        return 44;
    }
    return (SCREEN_HEIGHT-141-200.0*SCREEN_WIDTH/320)/[dataModel getServiceDescs].count-10 > (SCREEN_HEIGHT-136-200.0*SCREEN_WIDTH/320)/2-10 ? (SCREEN_HEIGHT-141-200.0*SCREEN_WIDTH/320)/[dataModel getServiceDescs].count-10 :(SCREEN_HEIGHT-136-200.0*SCREEN_WIDTH/320)/2-10;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.00000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00000001;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3+[dataModel getServiceDescs].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        PBDiscoverBannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBDiscoverBannerTableViewCell"];
        if (!cell)
        {
            cell = [[PBDiscoverBannerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBDiscoverBannerTableViewCell"];
        }
        [cell.pageControlScrollView setImages:[dataModel getBanners]];
        
        return cell;
    }
    else if (indexPath.row == 1 || indexPath.row == 2)
    {
        PBDiscoverDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBDiscoverDataTableViewCell"];
        if (!cell)
        {
            cell = [[PBDiscoverDataTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBDiscoverDataTableViewCell"];
        }
        NSDictionary *data = [[dataModel getCellObjects] objectAtIndex:indexPath.row-1];
        cell.titleLabel.text = [data objectForKey:@"title"];
        cell.dataLabel.text = [PBBaseModel formatterNumberWithoutDecimal:[data objectForKey:@"amount"]];
        
        return cell;
    }
    else
    {
        PBDiscoverServiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBDiscoverServiceTableViewCell"];
        if (!cell)
        {
            cell = [[PBDiscoverServiceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBDiscoverServiceTableViewCell"];
        }
        NSDictionary *data = [dataModel getServiceDescs][indexPath.row-3];
        if ([[data objectForKey:@"url"] isKindOfClass:[NSNull class]] || [[data objectForKey:@"url"] isEqualToString:@"null"])
        {
            cell.background.image = [UIImage imageNamed:@"DiscoverStructuredProduct"];
        }
        else
        {
            [cell.background sd_setImageWithURL:[NSURL URLWithString:[data objectForKey:@"url"]]];
        }
        cell.titleLabel.text = [data objectForKey:@"title"];
        cell.descriptionLabel.text = [data objectForKey:@"shortNote"];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        NSLog(@"wewewewew");
    }
    
}

@end
