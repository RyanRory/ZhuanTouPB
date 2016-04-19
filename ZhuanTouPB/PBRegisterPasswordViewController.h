//
//  PBRegisterPasswordViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"

@interface PBRegisterPasswordViewController : PBBaseViewController<UITextFieldDelegate>
{
    unsigned long lastLength; //记录textfield上一次输入的字符长度，用来判断placeholder执行动画
    NSString *passwordTextFieldStr;
    BOOL isSecureTextEntry;
}

@property (strong, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UIButton *secureEntryButton;

@end
