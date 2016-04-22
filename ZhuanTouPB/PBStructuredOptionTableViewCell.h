//
//  PBStructuredOptionTableViewCell.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/22.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBStructuredOptionTableViewCell : UITableViewCell
{
    BOOL isSelected;
}

@property (strong, nonatomic) IBOutlet UIImageView *checkboxImage;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

- (void)setIsSelected:(BOOL)flag;
- (BOOL)isSelectedOrNot;

@end
