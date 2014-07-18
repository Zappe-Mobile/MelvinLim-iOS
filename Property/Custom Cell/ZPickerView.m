//
//  ZPickerView.m
//  BBX
//
//  Created by Admin's on 03/06/14.
//  Copyright (c) 2014 Chaos Inc. All rights reserved.
//

#import "ZPickerView.h"
#import "AppointmentViewController.h"

@interface ZPickerView ()
{
    NSMutableArray * arrayPickerName;
    NSMutableArray * arrayPickerId;
    
    DatePickerType type;
    
    IBOutlet UIDatePicker * datePickerView;
    
    NSInteger selectedRow;
}
@end

@implementation ZPickerView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        datePickerView.backgroundColor = [UIColor whiteColor];
        datePickerView.tintColor = [UIColor whiteColor];
        datePickerView.timeZone = [NSTimeZone localTimeZone];
        

    }
    return self;
}

- (void)loadDataForPickerType:(DatePickerType)pickerType
{
    type = pickerType;
    
    arrayPickerId = [[NSMutableArray alloc]init];
    arrayPickerName = [[NSMutableArray alloc]init];
    
    switch (pickerType) {
        case PickerTypeDate:
        {
            datePickerView.datePickerMode = UIDatePickerModeDate;
            //[self setCountryData:[DataManager loadAllActiveCountryFromCoreData]];
            
        }
            break;
        case PickerTypeTime:
        {
            datePickerView.datePickerMode = UIDatePickerModeTime;
            //[self setStateData:[DataManager loadAllStateInfoForCountryIdFromCoreData]];
        }
            break;
         default:
            break;
    }
    
    [datePickerView reloadInputViews];
}


- (IBAction)cancelButtonClicked:(id)sender
{
    [self removeFromSuperview];
}

- (IBAction)doneButtonClicked:(id)sender
{
    switch (type) {
        case PickerTypeDate:
        {
            NSLog(@"%@",datePickerView.date);
            
            NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit |NSYearCalendarUnit fromDate:datePickerView.date];
            NSInteger _day=[dateComponents day];
            
            NSInteger _month=[dateComponents month];
            
            NSInteger _year = [dateComponents year];
            
            NSLog(@"%d-%d-%d",_day,_month,_year);
            
            NSString * strDate = [NSString stringWithFormat:@"%d-%d-%d",_day,_month,_year];
            
            [(AppointmentViewController *) delegate setSelectedValue:strDate WithSelectedId:@"" WithPickerType:PickerTypeDate];


        }
            break;
        case PickerTypeTime:
        {
            NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit |NSSecondCalendarUnit fromDate:datePickerView.date];
            NSInteger _hour=[dateComponents hour];
            
            NSInteger _minute=[dateComponents minute];
            
            NSInteger _second = [dateComponents second];
            
            NSLog(@"%d-%d-%d",_hour,_minute,_second);
            
            NSString * strDate = [NSString stringWithFormat:@"%d:%d",_hour,_minute];
            
            [(AppointmentViewController *) delegate setSelectedValue:strDate WithSelectedId:@"" WithPickerType:PickerTypeTime];
            
        }
            break;
        default:
            break;
    }

    [self removeFromSuperview];
}

@end
