//
//  PBBaseModel.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@implementation PBBaseModel

+ (BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController
{
    return (viewController.isViewLoaded && viewController.view.window);
}

+ (NSString*)formatterNumberWithoutDecimal:(NSString*)number
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    if ([number rangeOfString:@"."].location != NSNotFound)
    {
        return [self formatterNumberWithDecimal:number];
    }
    [formatter setPositiveFormat:@"###,##0"];
    return [formatter stringFromNumber:[NSNumber numberWithDouble:number.doubleValue]];
}

+ (NSString*)formatterNumberWithDecimal:(NSString*)number
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    if ([number rangeOfString:@"."].location == NSNotFound)
    {
        return [self formatterNumberWithoutDecimal:number];
    }
    else
    {
        [formatter setPositiveFormat:@"###,##0.00"];
        return [formatter stringFromNumber:[NSNumber numberWithDouble:number.doubleValue]];
    }
}

+ (NSString *)md5HexDigest:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    return ret;
}

+ (NSString*)boolToString:(BOOL)flag
{
    if (flag)
    {
        return @"true";
    }
    else
    {
        return @"false";
    }
}

+ (void)saveToPlist:(NSString*)fileName data:(id)data
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    NSString *filename=[plistPath stringByAppendingPathComponent:fileName];
    [data writeToFile:filename atomically:YES];
}

+ (id)readFromPlist:(NSString*)fileName
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    NSString *filename=[plistPath stringByAppendingPathComponent:fileName];
    NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filename];
    return data;
}

+ (BOOL)isExistenceNetwork
{
    BOOL isExistenceNetwork;
    Reachability *reachability = [Reachability reachabilityWithHostName:BASEURL];  // 测试服务器状态
    
    switch([reachability currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = FALSE;
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = TRUE;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = TRUE;
            break;
    }
    return  isExistenceNetwork;
}

+ (NSString*)deleteSpacesForString:(NSString*)str
{
    NSString *temp = str;
    while ([temp rangeOfString:@" "].location != NSNotFound)
    {
        temp = [temp stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return temp;
}

@end
