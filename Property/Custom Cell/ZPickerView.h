//
//  ZPickerView.h
//  BBX
//
//  Created by Admin's on 03/06/14.
//  Copyright (c) 2014 Chaos Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppointmentViewController.h"

@interface ZPickerView : UIView

@property (nonatomic, retain) id<DropDownType> delegate;
- (void)loadDataForPickerType:(DatePickerType)pickerType;
@end
