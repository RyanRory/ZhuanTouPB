//
//  PBMySPnSSViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBMySPnSSTableViewCell.h"
#import "PBMySPDataModel.h"
#import "PBMySSDataModel.h"

#import "PBProgressTrackingViewController.h"

@interface PBMySPnSSViewController : PBBaseViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *cellObjects;
    UIColor *styleColor;
    PBMySPDataModel *SPDataModel;
    PBMySSDataModel *SSDataModel;
}

@property(strong, nonatomic)NSString *style;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITableView *tView;

@end
