//
//  PBRegisterMobileViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBRegisterSmsCodeViewController.h"

@interface PBRegisterMobileViewController : PBBaseViewController<UITextFieldDelegate>
{
    unsigned long lastLength; //记录textfield上一次输入的字符长度，用来判断placeholder执行动画
}

@property (strong, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (strong, nonatomic) IBOutlet UITextField *mobileTextField;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
