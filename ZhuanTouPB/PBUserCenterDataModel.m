//
//  PBUserCenterDataModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/28.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBUserCenterDataModel.h"

@implementation PBUserCenterDataModel

static PBUserCenterDataModel *instance = nil;

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
    if (self = [super init])
    {
        balance = @"110.00";
        totalAmount = @"110.00";
    }
    
    return self;
}

- (void)getDataFromServer
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *URL = [BASEURL stringByAppendingString:[NSString stringWithFormat:@"api/account/myAccount4M"]];
    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSLog(@"%@", responseObject);
        
        balance = [NSString stringWithFormat:@"%@", [responseObject objectForKey:@"balance"]];
        totalAmount = [NSString stringWithFormat:@"%@", [responseObject objectForKey:@"totalReturnAmount"]];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Refresh" object:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ShowError" object:nil];
    }];
}

- (NSString*)getBalance
{
    return balance;
}

- (NSString*)getTotalAmount
{
    return totalAmount;
}

@end
