//
//  PBStockSourceAddViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/25.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStockSourceAddViewController.h"

@interface PBStockSourceAddViewController ()

@end

@implementation PBStockSourceAddViewController

@synthesize chooseView, stockCodeTextField, stockValueTextField, chooseListView;

#pragma ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [stockCodeTextField setPlaceHolderText:@"请输入您所持有的股票代码"];
    [stockCodeTextField setPlaceHolderChangeText:@"股票代码"];
    [stockCodeTextField setStockEntry:YES];
    stockCodeTextField.delegate = self;
    [stockCodeTextField addTarget:self action:@selector(stockCodeTextFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    [stockValueTextField setPlaceHolderText:@"请输入您所持有股票的市值"];
    [stockValueTextField setPlaceHolderChangeText:@"股票市值"];
    [stockValueTextField setNumberFomatterEntry:YES Decimal:YES];
    stockValueTextField.delegate = self;
    
    [chooseView setTitle:@"您持有股票的期限"];
    [chooseView addButtons:[NSArray arrayWithObjects:@"<1个月", @"1-3个月", @"3-6个月", @">6个月", @"暂不确定", nil] withMarginBetween:5 withMarginSides:0];
    [chooseView setButtonsFontSize:13];
    
    [stockCodeTextField becomeFirstResponder];
    
    chooseListView.hidden = YES;
    for (int i = 0; i < 5; i++)
    {
        UIButton *button = chooseListView.buttonArray[i];
        [button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    lastLength = 0;
    
    dataModel = [PBStockDataModel shareInstance];
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
    NSMutableDictionary *stockSource = [[NSMutableDictionary alloc]init];
    NSMutableArray *array = [NSMutableArray arrayWithArray:[dataModel getStockSourceArray]];
    if (array.count == 0)
    {
        array = [[NSMutableArray alloc]init];
    }
    NSString *code = [[stockCodeTextField getTextFieldStr] substringWithRange:NSMakeRange(0, 6)];
    NSString *name = [[stockCodeTextField getTextFieldStr] substringWithRange:NSMakeRange(6, [stockCodeTextField getTextFieldStr].length-6)];
    [stockSource setObject:code forKey:@"stockCode"];
    [stockSource setObject:[PBBaseModel deleteSpacesForString:name] forKey:@"stockName"];
    [stockSource setObject:[stockValueTextField getTextFieldStr] forKey:@"marketValue"];
    [stockSource setObject:[chooseView.buttonOnlyEngine getSelectedButtonTitle] forKey:@"preTime"];
    [stockSource setObject:[NSString stringWithFormat:@"%d",([chooseView.buttonOnlyEngine getSelectedButtonTag]+1)%5] forKey:@"lockCycle"];
    
    NSLog(@"%@",stockSource);
    [array addObject:stockSource];
    
    [dataModel setStockSourceArray:array];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma ChooseListView Function
- (void)setChooseListViewTitles
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:[PBSearchEngine SearchForObjectsBeginWith:[stockCodeTextField getTextFieldStr] inArray:[dataModel getStocksArray]]];
    int count = (int)array.count;
    if (count < 5)
    {
        for (int i=0; i<5-count; i++)
        {
            [array addObject:@{@"code":@"", @"name":@""}];
        }
    }
    [chooseListView setButtonTitles:array];
}

- (void)buttonClickAction:(UIButton*)sender
{
    stockCodeTextField.text = sender.titleLabel.text;
    chooseListView.hidden = YES;
}

#pragma TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //返回一个BOOL值，指明是否允许在按下回车键时结束编辑
    //如果允许要调用resignFirstResponder 方法，这回导致结束编辑，而键盘会被收起
    if (textField == stockCodeTextField)
    {
        [stockCodeTextField resignFirstResponder];
        [stockValueTextField becomeFirstResponder];
    }
    else
    {
        [self next:nil];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == stockValueTextField)
    {
        chooseListView.hidden = YES;
        stockValueTextField.text = [stockValueTextField getTextFieldStr];
    }
    return YES;
}

- (void)stockCodeTextFieldEditingChanged:(PBSmartPlaceholderTextField*)textfield
{
    if (textfield.text.length > 0)
    {
        chooseListView.hidden = NO;
        [self setChooseListViewTitles];
        [PBAnimator transpositionAnimation:chooseListView toPoint:CGPointMake(17*textfield.text.length, 0) duration:0.1f];
    }
    else
    {
        chooseListView.hidden = YES;
    }
    
    lastLength = textfield.text.length;
}


@end
