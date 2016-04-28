//
//  PBDiscoverDataModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/27.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBDiscoverDataModel.h"

@implementation PBDiscoverDataModel

static PBDiscoverDataModel *instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init] ;
    }) ;
    
    return instance ;
}

- (instancetype)init
{
    if (self == [super init])
    {
        banners = [NSMutableArray arrayWithObjects:@{@"imageUrl":@"https://www.zhuantouwang.com/Content/images/web/index/banner4.jpg",@"alt":@""},@{@"imageUrl":@"https://www.zhuantouwang.com/Content/images/web/index/banner5.jpg",@"alt":@""},@{@"imageUrl":@"https://www.zhuantouwang.com/Content/images/web/index/banner3.jpg",@"alt":@""}, nil];
        cellObjects = [NSMutableArray arrayWithObjects:@{@"title":@"累计发行结构化产品(元)", @"amount":@"1000000"}, @{@"title":@"累计运行日内交易账户", @"amount":@"100000"}, nil];
        serviceDescs = [NSMutableArray arrayWithObjects:@{@"url":@"null",@"title":@"结构化产品",@"shortNote":@"为投顾二级市场\r\n结构化产品提供一站式服务"},@{@"url":@"null",@"title":@"日内股票\r\n投资管理",@"shortNote":@"最专业的投顾团队\r\n为您带来稳定的额外收益"}, nil];
        
        [self getDataFromServer];

    }
    return self;
}

- (void)getDataFromServer
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *URL = [BASEURL stringByAppendingString:[NSString stringWithFormat:@"api/settings/appHomeConfig"]];
    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        if ([[responseObject objectForKey:@"banners"] isKindOfClass:[NSNull class]])
        {
            banners = [NSMutableArray arrayWithObjects:@{@"imageUrl":@"https://www.zhuantouwang.com/Content/images/web/index/banner4.jpg",@"alt":@""},@{@"imageUrl":@"https://www.zhuantouwang.com/Content/images/web/index/banner5.jpg",@"alt":@""},@{@"imageUrl":@"https://www.zhuantouwang.com/Content/images/web/index/banner3.jpg",@"alt":@""}, nil];
        }
        else
        {
            banners = [NSMutableArray arrayWithArray:[responseObject objectForKey:@"banners"]];
        }
        
        cellObjects = [NSMutableArray arrayWithObjects:@{@"title":@"累计发行结构化产品(元)", @"amount":[NSString stringWithFormat:@"%@",[responseObject objectForKey:@"totalStructuring"]]}, @{@"title":@"累计运行日内交易账户", @"amount":[NSString stringWithFormat:@"%@",[responseObject objectForKey:@"totalIntraday"]]}, nil];
        serviceDescs = [NSMutableArray arrayWithArray:[responseObject objectForKey:@"serviceDescs"]];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Refresh" object:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ShowError" object:nil];
    }];
}

- (NSArray*)getBanners
{
    return banners;
}

- (NSArray*)getCellObjects
{
    return cellObjects;
}

- (NSArray*)getServiceDescs
{
    return serviceDescs;
}

@end
