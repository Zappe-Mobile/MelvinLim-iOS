//
//  LoanPickerView.m
//  Property
//
//  Created by rkhan-mbook on 17/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "LoanPickerView.h"
#import "TDSRCalculatorViewController.h"

@interface LoanPickerView ()
{
    NSMutableArray * arrayPickerName;
    
    IBOutlet UIPickerView * pickerViewDirectory;
    
    NSInteger selectedRow;
}
@end

@implementation LoanPickerView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)loadData
{
    selectedRow = 0;
    arrayPickerName = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",nil];
    
    
    [pickerViewDirectory reloadAllComponents];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [arrayPickerName count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [arrayPickerName objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    selectedRow = row;
}


- (IBAction)cancelButtonClicked:(id)sender
{
    [self removeFromSuperview];
}

- (IBAction)doneButtonClicked:(id)sender
{
    [(TDSRCalculatorViewController *) delegate setSelectedValue:[arrayPickerName objectAtIndex:selectedRow]];
    [self removeFromSuperview];
}


@end
