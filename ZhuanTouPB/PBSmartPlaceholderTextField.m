//
//  PBSmartPlaceholderTextField.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/20.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBSmartPlaceholderTextField.h"

@implementation PBSmartPlaceholderTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init
{
    if (self = [super init])
    {
        [self initPlaceHolderLabel];
        [self addTarget:self action:@selector(editingChanged:) forControlEvents:UIControlEventEditingChanged];
        lastLength = 0;
        self.clipsToBounds = NO;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self initPlaceHolderLabel];
        [self addTarget:self action:@selector(editingChanged:) forControlEvents:UIControlEventEditingChanged];
        lastLength = 0;
        self.clipsToBounds = NO;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initPlaceHolderLabel];
        [self addTarget:self action:@selector(editingChanged:) forControlEvents:UIControlEventEditingChanged];
        lastLength = 0;
        self.clipsToBounds = NO;
    }
    return self;
}

//初始化placeholderLabel
- (void)initPlaceHolderLabel
{
    self.placeholderLabel = [[UILabel alloc]initWithFrame:self.bounds];
    self.placeholderLabel.alpha = 0.4;
    self.placeholderLabel.textColor = self.tintColor;
    self.placeholderLabel.font = [UIFont systemFontOfSize:[self.font pointSize]*0.8];
    [self addSubview:self.placeholderLabel];
    [self sendSubviewToBack:self.placeholderLabel];
    textFieldStr = @"";
}

//设置变换前后文字
- (void)setPlaceHolderText:(NSString*)str
{
    self.placeholderLabel.text = str;
    placeholderText = self.placeholderLabel.text;
}

- (void)setPlaceHolderChangeText:(NSString*)str
{
    placeholderChangedText = str;
}

//获取textField上的真正内容
- (NSString*)getTextFieldStr
{
    return textFieldStr;
}

//设置是否安全输入
- (void)setSecureTextEntry:(BOOL)flag
{
    isSecureTextEntry = flag;
    if (flag)
    {
        if (self.text.length > 0)
        {
            self.text = @"";
            for (int i=0; i<textFieldStr.length; i++)
            {
                self.text = [self.text stringByAppendingString:@"*"];
            }
        }
    }
    else
    {
        self.text = textFieldStr;
    }
}

//设置是否格式化数字输入
- (void)setNumberFomatterEntry:(BOOL)flag
{
    isNumberFomatterEntry = flag;
}

//输入监听
- (void)shouldLabelAnimated:(UITextField*)textField
{
    if (textField.text.length > 0 && lastLength == 0)
    {
        self.placeholderLabel.text = placeholderChangedText;
        [self labelAnimation:YES label:self.placeholderLabel];
    }
    if (textField.text.length == 0 && lastLength > 0)
    {
        self.placeholderLabel.text = placeholderText;
        [self labelAnimation:NO label:self.placeholderLabel];
    }
    lastLength = self.text.length;
}

- (void)editingChanged:(UITextField*)sender
{
    //实现textfield安全输入，记录textfield实际文字
    if (sender.text.length > lastLength)
    {
        if (isSecureTextEntry && lastLength > 0)
        {
            self.text = [self.text stringByReplacingCharactersInRange:NSMakeRange(lastLength-1, 1) withString:@"*"];
        }
        textFieldStr = [textFieldStr stringByAppendingString:[self.text substringWithRange:NSMakeRange(lastLength, 1)]];
        if (isNumberFomatterEntry && lastLength > 0)
        {
            self.text = [PBBaseModel formatterNumberWithoutDecimal:[NSNumber numberWithDouble:textFieldStr.doubleValue]];
        }
    }
    else
    {
        textFieldStr = [textFieldStr substringWithRange:NSMakeRange(0, textFieldStr.length+self.text.length-lastLength)];
        if (isNumberFomatterEntry && self.text.length > 0)
        {
            self.text = [PBBaseModel formatterNumberWithoutDecimal:[NSNumber numberWithDouble:textFieldStr.doubleValue]];
        }
    }
    [self shouldLabelAnimated:sender];
}

//动画
- (void)labelAnimation:(BOOL)flyUp label:(UILabel*)sender
{
    float x = sender.bounds.size.width/8;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2f];
    if (flyUp)
    {
        [sender setAlpha:1.0f];
        CGAffineTransform t = CGAffineTransformMakeTranslation(0-x, -28);
        t = CGAffineTransformScale(t, 0.75, 0.75);
        sender.transform = t;
    }
    else
    {
        [sender setAlpha:0.4f];
        sender.transform = CGAffineTransformMakeScale(1, 1);
    }
    [UIView commitAnimations];
}

@end
