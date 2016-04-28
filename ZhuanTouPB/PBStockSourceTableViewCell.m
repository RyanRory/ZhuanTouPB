//
//  PBStockSourceTableViewCell.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/26.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStockSourceTableViewCell.h"

@implementation PBStockSourceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.deleteButton.layer setBorderColor:[UIColor colorWithWhite:1 alpha:0.5].CGColor];
    [self.deleteButton.layer setBorderWidth:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
