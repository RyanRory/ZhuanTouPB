//
//  PBWebView.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBWebView : UIWebView<UIWebViewDelegate>
{
    NSTimer *timer;
    NSString *URL;
}

@property (strong, nonatomic) UIButton *reloadButton;

- (void)loadWebWithUrl:(NSString*)url;

@end
