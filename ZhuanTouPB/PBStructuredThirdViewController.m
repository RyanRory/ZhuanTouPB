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
    chosenData = [[NSMutableArray alloc]init];
    
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
    
    dataModel = [PBStructuredProductDataModel shareInstance];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    PBNavigationController *nav = (PBNavigationController*)self.navigationController;
    [nav setPageOfPageControl:2];
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
    [dataModel set:chosenData forKey:@"TradeStrategies"];
    PBStructuredInputTableViewCell *cell = [tView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:data.count+1]];
    [dataModel set:[cell.textField getTextFieldStr] forKey:@"ExpectedSeniorCost"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *URL = [BASEURL stringByAppendingString:[NSString stringWithFormat:@"api/struct/sendStructReq"]];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:[dataModel getDictionary]];
    NSLog(@"%@",parameters);
    [manager POST:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        if ([NSString stringWithFormat:@"%@", [responseObject objectForKey:@"isSuccess"]].boolValue)
        {
            PBStructuredSuccessViewController *vc = [[self storyboard]instantiateViewControllerWithIdentifier:@"PBStructuredSuccessViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];

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
        [cell.textField setPercentEntry:YES];
        
        return cell;
    }
    else
    {
        PBStructuredOptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PBStructuredOptionTableViewCell"];
        if (!cell)
        {
            cell = [[PBStructuredOptionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PBStructuredOptionTableViewCell"];
        }
        cell.checkboxImage.image = [UIImage imageNamed:@"CheckBoxUnselected"];
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
            cell.checkboxImage.image = [UIImage imageNamed:@"CheckBoxSelected"];
            [chosenData addObject:[data objectAtIndex:indexPath.section-1]];
        }
        else
        {
            [cell setIsSelected:NO];
            cell.checkboxImage.image = [UIImage imageNamed:@"CheckBoxUnselected"];
            [chosenData removeObject:[data objectAtIndex:indexPath.section-1]];
        }
    }
}

@end
