//
//  PBSearchEngine.m
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/25.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBSearchEngine.h"

@implementation PBSearchEngine

+ (NSArray*)SearchForObjectsBeginWith:(NSString*)str inArray:(NSArray*)array
{
    NSMutableArray *results = [[NSMutableArray alloc]init];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[cd] %@", str];
    for (int i=0; i<array.count; i++)
    {
        id obj = array[i];
        if ([predicate evaluateWithObject:[NSString stringWithFormat:@"%@",[obj objectForKey:@"code"]]])
        {
            [results addObject:obj];
        }
    }
    return results;
}

@end
