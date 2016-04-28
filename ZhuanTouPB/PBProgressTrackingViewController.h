//
//  PBProgressTrackingViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBSPProgressDataModel.h"
#import "PBSSProgressDataModel.h"
#import "PBProgressTrackingTableViewCell.h"

@interface PBProgressTrackingViewController : PBBaseViewController<UITableViewDelegate ,UITableViewDataSource>
{
    PBSPProgressDataModel *SPDataModel;
    PBSSProgressDataModel *SSDataModel;
    NSArray *cellObjects;
    UIColor *styleColor;
}

@property (strong, nonatomic)NSString *style;
@property (strong, nonatomic) IBOutlet UIView *navigationBarView;
@property (strong, nonatomic) IBOutlet UITableView *tView;

@end
