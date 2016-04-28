//
//  PBLoginMobileViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBLoginDataModel.h"

#import "PBLoginPasswordViewController.h"

@interface PBLoginMobileViewController : PBBaseViewController<UITextFieldDelegate, UIGestureRecognizerDelegate>
{
    PBLoginDataModel *dataModel;
}

@property (strong, nonatomic) IBOutlet PBSmartPlaceholderTextField *mobileTextField;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
