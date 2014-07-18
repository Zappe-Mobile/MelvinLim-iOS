//
//  DataManager.m
//  Property
//
//  Created by rkhan-mbook on 09/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "DataManager.h"
#import "Feeds.h"

@implementation DataManager

+(void)storeFeedDataWithArray:(NSArray *)dataArray withDataBlock:(DataBlock)block
{
    for (Feeds * feed in [DataManager fetchAllFeedsFromCoreData]) {
        [feed MR_deleteEntity];
    }
    
    NSLog(@"%@",dataArray);
    
    [dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
       
           Feeds * feedObj = [Feeds MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
            
            
            if ([[obj objectForKey:@"category"]objectForKey:@"text"]!= NULL) {
                feedObj.propertyCategory = [[obj objectForKey:@"category"]objectForKey:@"text"];
            }
            else {
                feedObj.propertyCategory = @"";
            }
            
            if ([[obj objectForKey:@"description"]objectForKey:@"text"]!= NULL) {
                feedObj.propertyDescription = [[obj objectForKey:@"description"]objectForKey:@"text"];
            }
            else {
                feedObj.propertyDescription = @"";
            }
            
            if ([[obj objectForKey:@"link"]objectForKey:@"text"]!= NULL) {
                feedObj.propertyLink = [[obj objectForKey:@"link"]objectForKey:@"text"];
            }
            else {
                feedObj.propertyLink = @"";
            }
            
            if ([[obj objectForKey:@"pubDate"]objectForKey:@"text"]!= NULL) {
                feedObj.propertyDate = [[obj objectForKey:@"pubDate"]objectForKey:@"text"];
            }
            else {
                feedObj.propertyDate = @"";
            }
            
            if ([[obj objectForKey:@"title"]objectForKey:@"text"]!= NULL) {
                feedObj.propertyTitle = [[obj objectForKey:@"title"]objectForKey:@"text"];
            }
            else {
                feedObj.propertyTitle = @"";
            }
    }];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:block];
}

+(NSMutableArray *)fetchAllFeedsFromCoreData
{
    return [Feeds MR_findAll].mutableCopy;
}
@end
