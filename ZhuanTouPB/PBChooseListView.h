//
//  PBChooseListView.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/25.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBChooseListView : UIView

@property (strong, nonatomic) NSMutableArray *buttonArray;

- (void)setButtonTitles:(NSArray*)titles;

@end
