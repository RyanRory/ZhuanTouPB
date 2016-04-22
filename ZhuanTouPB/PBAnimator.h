//
//  PBAnimator.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/19.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBAnimator : NSObject

+ (void)shakeView:(UIView*)viewToShake;
+ (void)transpositionAnimation:(UIView*)viewToMove byValue:(NSValue*)value duration:(float)duration;
+ (void)transopacityAnimation:(UIView*)viewToTrans fromValue:(float)fromValue toValue:(float)toValue duration:(float)duration;

@end
