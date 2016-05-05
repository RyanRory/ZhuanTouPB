//
//  PBMySSTableViewCell.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/5/5.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBSSInformationCellView.h"

@interface PBMySSTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *modeLabel;
@property (strong, nonatomic) IBOutlet UILabel *cycleLabel;
@property (strong, nonatomic) IBOutlet UILabel *progressLabel;
@property (strong, nonatomic) IBOutlet UIView *stocksView;
@property (strong, nonatomic) IBOutlet UILabel *achievementAmountLabel;
@property (strong, nonatomic) IBOutlet UILabel *achievementTimeLabel;
@property (strong, nonatomic) IBOutlet UIButton *toDrawButton;
@property (strong, nonatomic) IBOutlet UIButton *toAchievementButton;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

- (void)setStocks:(NSArray*)array;

@end
