//
//  PropertyBlocks.h
//  Property
//
//  Created by rkhan-mbook on 09/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#ifndef Property_PropertyBlocks_h
#define Property_PropertyBlocks_h

//! Block for completion of multiple tasks
typedef void (^CompletionBlock)(BOOL result, id resultObject);

//! Block for Core Data Operations
typedef void (^DataBlock)(BOOL success, NSError *error);


#endif
