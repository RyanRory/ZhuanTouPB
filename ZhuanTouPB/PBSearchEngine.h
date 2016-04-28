//
//  PBSearchEngine.h
//  ZhuanTouPB
//
//  Created by 赵润声 on 16/4/25.
//  Copyright © 2016年 ShanghaiMomuFinancialInformationServiceCo.,Ltd. All rights reserved.
//

#import "PBBaseModel.h"

@interface PBSearchEngine : PBBaseModel

+ (NSArray*)SearchForObjectsBeginWith:(NSString*)str inArray:(NSArray*)array;

@end
