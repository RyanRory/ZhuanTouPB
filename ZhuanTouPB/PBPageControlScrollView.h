//
//  PBPageControlScrollView.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/27.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBPageControlScrollView : UIView<UIScrollViewDelegate>
{
    int currentImage;
    NSArray *images;
    UIImageView *leftImage, *midImage, *rightImage;
    NSTimer *timer;
}

@property (strong, nonatomic)UIPageControl *pageControl;
@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic)UIButton *button;

- (void)setImages:(NSArray*)array;

@end
