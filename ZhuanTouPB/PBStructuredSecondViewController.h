//
//  PBStructuredSecondViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/21.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBStructuredChooseView.h"
#import "PBStructuredThirdViewController.h"

@interface PBStructuredSecondViewController : PBBaseViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet PBSmartPlaceholderTextField *posteriorTextField;
@property (strong, nonatomic) IBOutlet PBStructuredChooseView *chooseView;

@end
