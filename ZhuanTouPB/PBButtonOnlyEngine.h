//
//  PBButtonOnlyEngine.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/21.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@interface PBButtonOnlyEngine : PBBaseModel
{
    NSMutableArray *buttons;
    int selectedTag;
}

- (void)addButton:(PBBorderedButton*)button;
- (int)getSelectedButtonTag;
- (NSString*)getSelectedButtonTitle;
- (NSArray*)getButtons;

@end
