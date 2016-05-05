//
//  PBSSAchievementTableViewCell.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/5/5.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBSSAchievementTableViewCell.h"

@implementation PBSSAchievementTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setContentText:(NSString *)text
{
    CGRect frame = [self frame];
    self.contentLabel.text = text;
    self.contentLabel.numberOfLines = 0;
    CGSize size = CGSizeMake(SCREEN_WIDTH, 1000);
    CGSize labelSize = [self.contentLabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:nil context:nil].size;
    self.contentLabel.frame = CGRectMake(self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y, labelSize.width, labelSize.height);
    frame.size.height = labelSize.height + 44;
    self.frame = frame;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
