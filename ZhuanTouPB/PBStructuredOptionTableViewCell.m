//
//  PBStructuredOptionTableViewCell.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/22.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBStructuredOptionTableViewCell.h"

@implementation PBStructuredOptionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];

   // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted)
    {
        self.contentLabel.alpha = 0.5;
        self.checkboxImage.alpha = 0.5;
    }
    else
    {
        self.contentLabel.alpha = 1;
        self.checkboxImage.alpha = 1;
    }
}

- (void)setIsSelected:(BOOL)flag
{
    isSelected = flag;
}

- (BOOL)isSelectedOrNot
{
    return isSelected;
}

@end
