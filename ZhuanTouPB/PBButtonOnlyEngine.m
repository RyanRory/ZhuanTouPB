//
//  PBButtonOnlyEngine.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/21.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBButtonOnlyEngine.h"

@implementation PBButtonOnlyEngine

- (instancetype)init
{
    if (self = [super init])
    {
        buttons = [[NSMutableArray alloc]init];
        selectedTag = -1;
    }
    
    return self;
}

- (void)addButton:(PBBorderedButton*)button
{
    [buttons addObject:button];
    button.tag = buttons.count;
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickButton:(PBBorderedButton*)sender
{
    if (!sender.selected)
    {
        sender.selected = YES;
        selectedTag = (int)sender.tag;
        [sender setSelectedBorder];
        for (int i = 0; i < buttons.count; i++)
        {
            PBBorderedButton *tempButton = buttons[i];
            if (tempButton.tag != sender.tag)
            {
                [tempButton clearBorder];
                tempButton.selected = NO;
            }
        }
    }
}

- (int)getSelectedButtonTag
{
    return  selectedTag;
}

- (NSArray*)getButtons
{
    return buttons;
}

@end
