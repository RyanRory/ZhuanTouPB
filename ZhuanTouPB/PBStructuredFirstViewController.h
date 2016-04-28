//
//  PBStructuredFirstViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/20.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBStructuredChooseView.h"
#import "PBStructuredProductDataModel.h"

#import "PBStructuredSecondViewController.h"

@interface PBStructuredFirstViewController : PBBaseViewController
{
    PBStructuredProductDataModel *dataModel;
}

@property (strong, nonatomic) IBOutlet PBStructuredChooseView *chooseView1;
@property (strong, nonatomic) IBOutlet PBStructuredChooseView *chooseView2;

@end
