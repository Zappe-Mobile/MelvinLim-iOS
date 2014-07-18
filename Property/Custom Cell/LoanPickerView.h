//
//  LoanPickerView.h
//  Property
//
//  Created by rkhan-mbook on 17/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDSRCalculatorViewController.h"

@interface LoanPickerView : UIView

@property (nonatomic, retain) id<LoanTenure> delegate;
- (void)loadData;

@end
