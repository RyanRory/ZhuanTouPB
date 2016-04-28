//
//  PBPageControlScrollView.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/27.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBPageControlScrollView.h"

@implementation PBPageControlScrollView

- (instancetype)init
{
    if (self = [super init])
    {
        [self initSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self initSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    currentImage = 0;
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.pageControl = [[UIPageControl alloc]init];
    leftImage = [[UIImageView alloc]init];
    midImage = [[UIImageView alloc]init];
    rightImage = [[UIImageView alloc]init];
    [self.scrollView addSubview:leftImage];
    [self.scrollView addSubview:midImage];
    [self.scrollView addSubview:rightImage];
    
    self.button = [[UIButton alloc]init];
    
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    //[self addSubview:self.button];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [super updateConstraints];
    [self.scrollView setFrame:self.bounds];
    self.scrollView.contentSize = CGSizeMake(self.bounds.size.width * 3, 0);
    [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:NO];
    [leftImage setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [midImage setFrame:CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
    [rightImage setFrame:CGRectMake(self.bounds.size.width*2, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:NO];
    [self.button setFrame:self.bounds];
    [self.pageControl setFrame:CGRectMake(0, self.bounds.size.height-20, self.bounds.size.width, 20)];
}

- (void)setImages:(NSArray*)array
{
    images = [NSArray arrayWithArray:array];
    [self.pageControl setNumberOfPages:images.count];
    [self.pageControl setCurrentPage:currentImage];

    [midImage sd_setImageWithURL:[NSURL URLWithString:[[images objectAtIndex:currentImage] objectForKey:@"imageUrl"]]];
    [leftImage sd_setImageWithURL:[NSURL URLWithString:[[images objectAtIndex:images.count-1] objectForKey:@"imageUrl"]]];
    [rightImage sd_setImageWithURL:[NSURL URLWithString:[[images objectAtIndex:(currentImage+1)%images.count] objectForKey:@"imageUrl"]]];
    
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(scrollToNextPage:) userInfo:nil repeats:YES];
}

- (void)scrollToNextPage:(id)sender
{
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * 2, 0) animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrView
{
    [timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrView willDecelerate:(BOOL)decelerate
{
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(scrollToNextPage:) userInfo:nil repeats:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrView
{
    [self reloadImage];
    [scrView setContentOffset:CGPointMake(scrView.frame.size.width, 0) animated:NO];
    self.pageControl.currentPage=currentImage;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrView
{
    [self reloadImage];
    [scrView setContentOffset:CGPointMake(scrView.frame.size.width, 0) animated:NO];
    self.pageControl.currentPage=currentImage;
}

- (void)reloadImage
{
    int leftImageIndex, rightImageIndex;
    CGPoint offset=[self.scrollView contentOffset];
    if (offset.x>self.scrollView.frame.size.width)
    { //向右滑动
        currentImage=(currentImage+1)%images.count;
    }
    else if(offset.x<self.scrollView.frame.size.width)
    {//向左滑动
        if (currentImage == 0)
            currentImage = (int)images.count -1;
        else
            currentImage=(currentImage-1)%images.count;
    }
    
    [midImage sd_setImageWithURL:[NSURL URLWithString:[[images objectAtIndex:currentImage] objectForKey:@"imageUrl"]]];
    
    //重新设置左右图片
    leftImageIndex = (currentImage-1)%images.count;
    rightImageIndex = (currentImage+1)%images.count;
    if (currentImage == 0)
    {
        leftImageIndex = (int)images.count-1;
    }
    [leftImage sd_setImageWithURL:[NSURL URLWithString:[[images objectAtIndex:leftImageIndex] objectForKey:@"imageUrl"]]];
    [rightImage sd_setImageWithURL:[NSURL URLWithString:[[images objectAtIndex:rightImageIndex] objectForKey:@"imageUrl"]]];
    
    self.button.tag = currentImage;
}

@end
