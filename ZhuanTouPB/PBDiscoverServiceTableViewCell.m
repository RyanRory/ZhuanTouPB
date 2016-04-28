//
//  PBDiscoverServiceTableViewCell.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/27.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBDiscoverServiceTableViewCell.h"

@implementation PBDiscoverServiceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted)
    {
        self.titleLabel.alpha = 0.5;
        self.descriptionLabel.alpha = 0.5;
    }
    else
    {
        self.titleLabel.alpha = 1;
        self.descriptionLabel.alpha = 1;
    }
}

@end
