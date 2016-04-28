//
//  PBDiscoverViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/27.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBDiscoverDataTableViewCell.h"
#import "PBDiscoverBannerTableViewCell.h"
#import "PBDiscoverServiceTableViewCell.h"
#import "PBDiscoverDataModel.h"

#import "PBUserCenterViewController.h"

@interface PBDiscoverViewController : PBBaseViewController<UITableViewDelegate, UITableViewDataSource>
{
    PBDiscoverDataModel *dataModel;
}

@property (strong, nonatomic) IBOutlet UITableView *tView;
@property (strong, nonatomic) IBOutlet UIButton *toUserCenterButton;

@end
