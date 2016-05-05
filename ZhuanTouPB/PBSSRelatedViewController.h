//
//  PBSSRelatedViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/5/5.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBSSDrawTableViewCell.h"
#import "PBSSAchievementTableViewCell.h"
#import "PBSSDrawDataModel.h"
#import "PBSSAchievementDataModel.h"

@interface PBSSRelatedViewController : PBBaseViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *cellObjects;
    PBSSDrawDataModel *DrawDataModel;
    PBSSAchievementDataModel *AchievementDataModel;
}

@property(strong, nonatomic)NSString *style;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITableView *tView;

@end
