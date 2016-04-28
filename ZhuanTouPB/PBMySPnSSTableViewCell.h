//
//  PBMySPnSSTableViewCell.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBMySPnSSTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *SSLabel1;
@property (strong, nonatomic) IBOutlet UILabel *SSLabel2;
@property (strong, nonatomic) IBOutlet UILabel *SSLabel3;
@property (strong, nonatomic) IBOutlet UILabel *statusNoteLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *SPLabel1;
@property (strong, nonatomic) IBOutlet UILabel *SPLabel2;

@end
