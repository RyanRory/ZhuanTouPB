//
//  PBRegisterPasswordViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBRegisterDataModel.h"
#import "PBRegisterSuccessViewController.h"

@interface PBRegisterPasswordViewController : PBBaseViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet PBSmartPlaceholderTextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UIButton *secureEntryButton;

@end
