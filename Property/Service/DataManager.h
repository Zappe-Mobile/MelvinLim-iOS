//
//  DataManager.h
//  Property
//
//  Created by rkhan-mbook on 09/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "PropertyBlocks.h"

@interface DataManager : NSObject

+(void)storeFeedDataWithArray:(NSArray *)dataArray withDataBlock:(DataBlock)block;

+(NSMutableArray *)fetchAllFeedsFromCoreData;
@end
