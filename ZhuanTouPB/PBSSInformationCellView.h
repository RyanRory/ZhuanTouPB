//
//  PBSSInformationCellView.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/5/5.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBSSInformationCellView : UIView

@property (strong, nonatomic)UILabel *label1;
@property (strong, nonatomic)UILabel *label2;
@property (strong, nonatomic)UILabel *label3;

- (void)setLabelFrame:(float)width;

@end
