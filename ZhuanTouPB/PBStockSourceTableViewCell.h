//
//  PBStockSourceTableViewCell.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/26.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBStockSourceTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *stockCodeNNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *marketValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *preTimeLabel;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;


@end
