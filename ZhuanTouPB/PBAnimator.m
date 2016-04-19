//
//  PBAnimator.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/19.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBAnimator.h"

@implementation PBAnimator

+ (void)labelAnimation:(BOOL)flyUp label:(UILabel*)sender
{
    //平移动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    float x = sender.bounds.size.width/8;
    if (flyUp)
    {
        NSLog(@"wwwwww");
        animation.byValue = [NSValue valueWithCGPoint:CGPointMake(0-x, -28)];
    }
    else
    {
        animation.byValue = [NSValue valueWithCGPoint:CGPointMake(x, 28)];
    }
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.repeatCount = 0;
    [animation setDuration:0.2f];
    [sender.layer addAnimation:animation forKey:nil];
    //透明度渐变动画
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
    opacityAnimation.repeatCount = 0;
    [opacityAnimation setDuration:0.2f];
    [sender.layer addAnimation:opacityAnimation forKey:nil];
    //缩放动画
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
    scaleAnimation.repeatCount = 0;
    [scaleAnimation setDuration:0.2f];
    [sender.layer addAnimation:scaleAnimation forKey:nil];
}

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
