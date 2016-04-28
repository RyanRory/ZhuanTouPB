//
//  PBBaseModel.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/18.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface PBBaseModel : NSObject

+ (BOOL)isCurrentViewControllerVisible:(UIViewController*)viewController;
+ (NSString*)formatterNumberWithoutDecimal:(NSString*)number;
+ (NSString*)formatterNumberWithDecimal:(NSString*)number;
+ (NSString*)md5HexDigest:(NSString*)input;
+ (NSString*)boolToString:(BOOL)flag;
+ (void)saveToPlist:(NSString*)fileName data:(id)data;
+ (id)readFromPlist:(NSString*)fileName;
+ (BOOL)isExistenceNetwork;
+ (NSString*)deleteSpacesForString:(NSString*)str;

@end
