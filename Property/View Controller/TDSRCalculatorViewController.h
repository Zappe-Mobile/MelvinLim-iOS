//
//  TDSRCalculatorViewController.h
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoanPickerView;
@protocol LoanTenure <NSObject>

@required
-(void)setSelectedValue:(NSString *)value;

@end

@interface TDSRCalculatorViewController : UIViewController <LoanTenure>

@end
