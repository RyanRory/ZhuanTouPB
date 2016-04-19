//
//  PBWebView.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBWebView.h"

@implementation PBWebView

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
        [self initView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initView];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self initView];
    }
    
    return self;
}

//在webView上加一个重新加载按钮
- (void)initView
{
    self.reloadButton = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width/2-45, self.bounds.size.height/2-15, 90, 30)];
    [self.reloadButton setTitle:@"点击重新加载" forState:UIControlStateNormal];
    [self.reloadButton addTarget:self action:@selector(reloadWebView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.reloadButton];
}

#pragma Functions of PBWebView
- (void)loadWebWithUrl:(NSString *)url
{
    URL = url;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self loadRequest:request];
}

- (void)reloadWebView:(id)sender
{
    [self loadWebWithUrl:URL];
}

- (void)webViewStopLaoding
{
    [self stopLoading];
    [timer invalidate];
    self.reloadButton.hidden = NO;
}

#pragma WebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.reloadButton.hidden = YES;
    timer = [NSTimer scheduledTimerWithTimeInterval:60.0f target:self selector:@selector(webViewStopLaoding) userInfo:nil repeats:NO];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [timer invalidate];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [timer invalidate];
    NSLog(@"%@",error);
    self.reloadButton.hidden = NO;
}


@end
