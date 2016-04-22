//
//  PBRegisterMobileViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBRegisterDataModel.h"
#import "PBRegisterSmsCodeViewController.h"

@interface PBRegisterMobileViewController : PBBaseViewController<UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet PBSmartPlaceholderTextField *mobileTextField;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
