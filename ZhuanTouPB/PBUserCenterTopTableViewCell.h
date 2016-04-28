//
//  PBUserCenterTopTableViewCell.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/27.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBUserCenterTopTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *balanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *profitLabel;
@property (strong, nonatomic) IBOutlet UIButton *toBalanceButton;

@end
