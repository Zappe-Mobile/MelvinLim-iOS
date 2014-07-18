//
//  RequestManager.m
//  Property
//
//  Created by rkhan-mbook on 09/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "RequestManager.h"
#import "AFNetworking.h"
#import "XMLReader.h"

@interface RequestManager ()
{
    NSURLConnection * connection;
    NSMutableData * webData;
    
}
@property (nonatomic, copy, readwrite) CompletionBlock completionBlock;
@end

@implementation RequestManager
@synthesize completionBlock;

static RequestManager * sharedManager;

/**
 *  Initialization Method
 */
+ (void)initialize {
    static BOOL initialized = NO;
    if(!initialized) {
        initialized = YES;
		sharedManager = [[RequestManager alloc] init];
    }
}

#pragma mark - Singleton Object
/**
 *  Singleton Object
 *
 *  @return RequestManager Singleton Object
 */
+ (RequestManager *)sharedManager {
	return (sharedManager);
}

- (void)fetchFeedsWithCompletionBlock:(CompletionBlock)block
{
    self.completionBlock = block;
    
    NSURL *URL = [NSURL URLWithString:@"http://www.propertyguru.com.sg/rss"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData  timeoutInterval:10];
    
    [request setHTTPMethod:@"GET"];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFXMLParserResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/rss+xml"];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //parse NSXMLParser object here if request successfull
        if ([responseObject isKindOfClass:[NSXMLParser class]]) {
            
            NSError * error;
            NSDictionary *dict = [XMLReader dictionaryForXMLData:operation.responseData error:&error];
            NSLog(@"JSON:%@",dict);
            
            NSMutableDictionary * dict1 = [[[dict objectForKey:@"rss"]
                                               objectForKey:@"channel"]
                                              objectForKey:@"item"];

            self.completionBlock (YES, dict1);
        
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", [error localizedDescription]);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"No Internet connection Please try again."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        self.completionBlock(NO, error);
    
    }];
    
    [op start];

}

@end
