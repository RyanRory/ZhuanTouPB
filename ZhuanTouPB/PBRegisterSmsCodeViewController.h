//
//  PBRegisterSmsCodeViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBRegisterDataModel.h"
#import "PBRegisterPasswordViewController.h"

@interface PBRegisterSmsCodeViewController : PBBaseViewController<UITextFieldDelegate>
{
    NSTimer *timer; //计时器
    int secondsCountDown; //秒数
}

@property (strong, nonatomic) IBOutlet PBSmartPlaceholderTextField *smsCodeTextField;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;
@property (strong, nonatomic) IBOutlet UIButton *smsCodeButton;

@end
