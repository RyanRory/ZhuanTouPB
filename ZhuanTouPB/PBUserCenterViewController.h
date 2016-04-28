//
//  PBUserCenterViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/27.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBUserCenterTopTableViewCell.h"
#import "PBUserCenterLabelTableViewCell.h"
#import "PBUserCenterDataModel.h"

#import "PBStructuredFirstViewController.h"
#import "PBStockSourceViewController.h"
#import "PBBlanceViewController.h"
#import "PBMySPnSSViewController.h"

@interface PBUserCenterViewController : PBBaseViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *cellObjects;
    PBUserCenterDataModel *dataModel;
}

@property (strong, nonatomic) IBOutlet UITableView *tView;
@property (strong, nonatomic) IBOutlet UIButton *toDiscoverButton;

@end
