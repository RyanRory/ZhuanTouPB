//
//  PBStructuredThirdViewController.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/21.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseViewController.h"
#import "PBStructuredTitleTableViewCell.h"
#import "PBStructuredOptionTableViewCell.h"
#import "PBStructuredInputTableViewCell.h"
#import "PBStructuredProductDataModel.h"

#import "PBStructuredSuccessViewController.h"

@interface PBStructuredThirdViewController : PBBaseViewController<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *data, *chosenData;
    PBStructuredProductDataModel *dataModel;
}

@property (strong, nonatomic) IBOutlet UITableView *tView;
@property (strong, nonatomic) IBOutlet UIButton *confirmButton;


@end
