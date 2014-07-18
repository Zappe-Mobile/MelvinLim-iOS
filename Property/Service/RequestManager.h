//
//  RequestManager.h
//  Property
//
//  Created by rkhan-mbook on 09/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PropertyBlocks.h"

@interface RequestManager : NSObject

+ (RequestManager *)sharedManager;


- (void)fetchFeedsWithCompletionBlock:(CompletionBlock)block;

@end
