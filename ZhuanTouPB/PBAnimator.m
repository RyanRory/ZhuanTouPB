//
//  PBAnimator.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/19.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBAnimator.h"

@implementation PBAnimator

//抖动动画
+ (void)shakeView:(UIView*)viewToShake
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

//平移动画
+ (void)transpositionAnimation:(UIView*)viewToTrans byValue:(NSValue*)value duration:(float)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.byValue = value;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    [animation setDuration:duration];
    [viewToTrans.layer addAnimation:animation forKey:nil];
}

//透明度渐变动画
+ (void)transopacityAnimation:(UIView*)viewToTrans fromValue:(float)fromValue toValue:(float)toValue duration:(float)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:fromValue];
    animation.toValue = [NSNumber numberWithFloat:toValue];
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    [animation setDuration:duration];
    [viewToTrans.layer addAnimation:animation forKey:nil];
}

@end
