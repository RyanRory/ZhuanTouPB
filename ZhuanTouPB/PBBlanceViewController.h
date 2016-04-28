//
//  PBBlanceViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBBalanceDataModel.h"
#import "PBBalanceTableViewCell.h"

@interface PBBlanceViewController : PBBaseViewController<UITableViewDelegate, UITableViewDataSource>
{
    PBBalanceDataModel *dataModel;
}

@property (strong, nonatomic) IBOutlet UILabel *balanceLabel;
@property (strong, nonatomic) IBOutlet UITableView *tView;
@property (strong, nonatomic) IBOutlet UIButton *toChargeButton;

@end
