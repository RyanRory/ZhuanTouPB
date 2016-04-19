//
//  PBRegisterMobileViewController.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBRegisterMobileViewController.h"

@interface PBRegisterMobileViewController ()

@end

@implementation PBRegisterMobileViewController

@synthesize placeholderLabel, mobileTextField, descriptionLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [mobileTextField becomeFirstResponder];
    [mobileTextField addTarget:self action:@selector(editingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    lastLength = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Animations
- (void)labelAnimation:(BOOL)flyUp label:(UILabel*)sender
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    float x = sender.bounds.size.width/8;
    if (flyUp)
    {
        animation.byValue = [NSValue valueWithCGPoint:CGPointMake(0-x, -26)];
    }
    else
    {
        animation.byValue = [NSValue valueWithCGPoint:CGPointMake(x, 26)];
    }
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    [animation setDuration:0.2f];
    [sender.layer addAnimation:animation forKey:nil];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    if (flyUp)
    {
        opacityAnimation.fromValue = [NSNumber numberWithFloat:0.4];
        opacityAnimation.toValue = [NSNumber numberWithFloat:1];
    }
    else
    {
        opacityAnimation.fromValue = [NSNumber numberWithFloat:1];
        opacityAnimation.toValue = [NSNumber numberWithFloat:0.4];
    }
    opacityAnimation.removedOnCompletion=NO;
    opacityAnimation.fillMode=kCAFillModeForwards;
    [opacityAnimation setDuration:0.2f];
    [sender.layer addAnimation:opacityAnimation forKey:nil];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    if (flyUp)
    {
        scaleAnimation.fromValue = [NSNumber numberWithFloat:1];
        scaleAnimation.toValue = [NSNumber numberWithFloat:0.75];
    }
    else
    {
        scaleAnimation.fromValue = [NSNumber numberWithFloat:0.75];
        scaleAnimation.toValue = [NSNumber numberWithFloat:1];
    }
    scaleAnimation.removedOnCompletion=NO;
    scaleAnimation.fillMode=kCAFillModeForwards;
    [scaleAnimation setDuration:0.2f];
    [sender.layer addAnimation:scaleAnimation forKey:nil];
}

-(void)shakeView:(UIView*)viewToShake
{
    CGFloat t =2.0;
    CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
    CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
    
    viewToShake.transform = translateLeft;
    
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        viewToShake.transform = translateRight;
    } completion:^(BOOL finished){
        if(finished){
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                viewToShake.transform =CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}


#pragma TextField Function
- (void)shouldLabelAnimated:(UILabel*)sender textField:(UITextField*)textField
{
    if (textField.text.length == 1 && lastLength == 0)
    {
        sender.text = @"手机号码";
        [self labelAnimation:YES label:placeholderLabel];
    }
    if (textField.text.length == 0 && lastLength == 1)
    {
        sender.text= @"请输入您的手机号码";
        [self labelAnimation:NO label:placeholderLabel];
    }
    lastLength = textField.text.length;
}

- (void)editingChanged:(UITextField*)sender
{
    [self shouldLabelAnimated:placeholderLabel textField:sender];
}

#pragma TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //返回一个BOOL值，指明是否允许在按下回车键时结束编辑
    //如果允许要调用resignFirstResponder 方法，这回导致结束编辑，而键盘会被收起
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //返回一个BOOL值，指定是否循序文本字段开始编辑
    if (textField.text.length == 0)
    {
        
    }
    return YES;
}

@end
