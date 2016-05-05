//
//  PBSSInformationCellView.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/5/5.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBSSInformationCellView.h"

@implementation PBSSInformationCellView

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
        [self initLabels];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self initLabels];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initLabels];
    }
    
    return self;
}

- (void)initLabels
{
    self.label1 = [[UILabel alloc]init];
    self.label2 = [[UILabel alloc]init];
    self.label3 = [[UILabel alloc]init];
    self.label1.font = [UIFont systemFontOfSize:11];
    self.label2.font = [UIFont systemFontOfSize:11];
    self.label3.font = [UIFont systemFontOfSize:11];
    self.label1.textColor = [UIColor lightGrayColor];
    self.label2.textColor = [UIColor lightGrayColor];
    self.label3.textColor = [UIColor lightGrayColor];
    self.label1.textAlignment = 0;
    self.label2.textAlignment = 1;
    self.label3.textAlignment = 2;
    
    [self addSubview:self.label1];
    [self addSubview:self.label2];
    [self addSubview:self.label3];
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    [super updateConstraints];
//    float width = self.frame.size.width/3;
//    [self.label1 setFrame:CGRectMake(0, 0, width, 14)];
//    [self.label2 setFrame:CGRectMake(width, 0, width, 14)];
//    [self.label3 setFrame:CGRectMake(width*2, 0, width, 14)];
//}

- (void)setLabelFrame:(float)width
{
    [self.label1 setFrame:CGRectMake(0, 0, width, 14)];
    [self.label2 setFrame:CGRectMake(width, 0, width, 14)];
    [self.label3 setFrame:CGRectMake(width*2, 0, width, 14)];
}


@end
