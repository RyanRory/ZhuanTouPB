//
//  PBRegisterSmsCodeViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBRegisterPasswordViewController.h"

@interface PBRegisterSmsCodeViewController : PBBaseViewController<UITextFieldDelegate>
{
    unsigned long lastLength; //记录textfield上一次输入的字符长度，用来判断placeholder执行动画
    NSTimer *timer; //计时器
    int secondsCountDown; //秒数
}

@property (strong, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (strong, nonatomic) IBOutlet UITextField *smsCodeTextField;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;
@property (strong, nonatomic) IBOutlet UIButton *smsCodeButton;

@end
