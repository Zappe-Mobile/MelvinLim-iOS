//
//  Feeds.h
//  Property
//
//  Created by rkhan-mbook on 10/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Feeds : NSManagedObject

@property (nonatomic, retain) NSString * propertyCategory;
@property (nonatomic, retain) NSString * propertyDescription;
@property (nonatomic, retain) NSString * propertyLink;
@property (nonatomic, retain) NSString * propertyDate;
@property (nonatomic, retain) NSString * propertyTitle;

@end
