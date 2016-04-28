//
//  PBStockSourceAddViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/25.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBStructuredChooseView.h"
#import "PBChooseListView.h"
#import "PBStockDataModel.h"

@interface PBStockSourceAddViewController : PBBaseViewController<UITextFieldDelegate>
{
    unsigned long lastLength;
    PBStockDataModel *dataModel;
}

@property (strong, nonatomic) IBOutlet PBStructuredChooseView *chooseView;
@property (strong, nonatomic) IBOutlet PBSmartPlaceholderTextField *stockCodeTextField;
@property (strong, nonatomic) IBOutlet PBSmartPlaceholderTextField *stockValueTextField;
@property (strong, nonatomic) IBOutlet PBChooseListView *chooseListView;

@end
