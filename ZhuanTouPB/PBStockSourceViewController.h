//
//  PBStockSourceViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/26.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBStructuredChooseView.h"
#import "PBStockDataModel.h"
#import "PBStockSourceButtonTableViewCell.h"
#import "PBStockSourceTableViewCell.h"

#import "PBStockSourceAddViewController.h"
#import "PBStockSourceCompleteViewController.h"

@interface PBStockSourceViewController : PBBaseViewController<UITableViewDelegate, UITableViewDataSource>
{
    PBStockDataModel *dataModel;
}

@property (strong, nonatomic) IBOutlet PBStructuredChooseView *chooseView;
@property (strong, nonatomic) IBOutlet UITableView *tView;

@end
