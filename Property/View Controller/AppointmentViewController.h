//
//  AppointmentViewController.h
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

typedef NS_ENUM(NSUInteger, DatePickerType)
{
    PickerTypeDate=0,
    PickerTypeTime
    
};



@class ZPickerView;
@protocol DropDownType <NSObject>

@required
-(void)setSelectedValue:(NSString *)value WithSelectedId:(NSString *)selectedId WithPickerType:(DatePickerType)pickerType;

@end

@interface AppointmentViewController : UIViewController <DropDownType>

@end
