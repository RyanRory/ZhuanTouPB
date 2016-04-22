//
//  PBSmartPlaceholderTextField.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/20.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBSmartPlaceholderTextField : UITextField
{
    unsigned long lastLength;
    NSString *placeholderText;
    NSString *placeholderChangedText;
    BOOL isSecureTextEntry, isNumberFomatterEntry;
    NSString *textFieldStr;
}

@property (strong, nonatomic) UILabel *placeholderLabel;

- (void)setPlaceHolderText:(NSString*)str;
- (void)setPlaceHolderChangeText:(NSString*)str;
- (NSString*)getTextFieldStr;
- (void)setSecureTextEntry:(BOOL)flag;
- (void)setNumberFomatterEntry:(BOOL)flag;


@end
