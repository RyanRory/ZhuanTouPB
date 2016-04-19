//
//  PBRegisterMobileViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"

@interface PBRegisterMobileViewController : PBBaseViewController<UITextFieldDelegate>
{
    unsigned long lastLength;
}

@property (strong, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (strong, nonatomic) IBOutlet UITextField *mobileTextField;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
