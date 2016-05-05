//
//  PBMySSTableViewCell.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/5/5.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBMySSTableViewCell.h"

@implementation PBMySSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.toDrawButton.layer setCornerRadius:3];
    [self.toDrawButton.layer setBorderWidth:1];
    [self.toDrawButton.layer setBorderColor:STOCKSOURCEBLUE.CGColor];
    
    [self.toAchievementButton.layer setCornerRadius:3];
    [self.toAchievementButton.layer setBorderWidth:1];
    [self.toAchievementButton.layer setBorderColor:STOCKSOURCEBLUE.CGColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [super updateConstraints];
    for (int i = 0; i < self.stocksView.subviews.count; i++)
    {
        [(PBSSInformationCellView *)self.stocksView.subviews[i] setLabelFrame:(self.frame.size.width-40)/3];
    }
}

- (void)setStocks:(NSArray *)array
{
    CGRect frame = self.stocksView.frame;
    for (int i = 0; i < array.count; i++)
    {
        id data = [array objectAtIndex:i];
        PBSSInformationCellView *view = [[PBSSInformationCellView alloc]initWithFrame:CGRectMake(0, 22*i, frame.size.width, 14)];
        view.label1.text = [NSString stringWithFormat:@"%@ %@", [data objectForKey:@"code"], [data objectForKey:@"name"]];
        view.label2.text = [NSString stringWithFormat:@"%@元",[data objectForKey:@"amount"]];
        view.label3.text = [NSString stringWithFormat:@"%@元",[data objectForKey:@"profit"]];
        
        [self.stocksView addSubview:view];
    }
    [self.stocksView setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 22*(array.count-1)+14)];
    CGRect cellFrame = self.frame;
    cellFrame.size.height = self.stocksView.frame.size.height + 204;
    self.frame = cellFrame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
