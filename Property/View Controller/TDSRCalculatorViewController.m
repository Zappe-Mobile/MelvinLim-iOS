//
//  TDSRCalculatorViewController.m
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "TDSRCalculatorViewController.h"
#import "UINavigationController+Extras.h"
#import "ResultsViewController.h"
#import <math.h>
#import "LoanPickerView.h"

@interface TDSRCalculatorViewController ()
{
    IBOutlet UITextField * txtMonthlyIncome;
    IBOutlet UITextField * txtMonthlyRepaymentNonProperty;
    IBOutlet UITextField * txtMonthlyRepaymentProperty;
    IBOutlet UITextField * txtInterestRate;
    IBOutlet UITextField * txtLoanAmount;
    IBOutlet UIButton * btnLoanTenure;
    
    NSString * strLoanTenure;
}
@property (strong, nonatomic) LoanPickerView * containerView;
@end

@implementation TDSRCalculatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"TDSR Calculator"];
}


- (IBAction)btnLoanTenureClicked:(id)sender
{
    _containerView = [[NSBundle mainBundle] loadNibNamed:@"LoanPickerView" owner:self options:nil][0];
    _containerView.frame = CGRectMake(0, 0, 320, 568);
    [_containerView loadData];
    _containerView.delegate = self;
    [self.view addSubview:_containerView];
 
}

- (void)setSelectedValue:(NSString *)value
{
    strLoanTenure = value;
    [btnLoanTenure setTitle:strLoanTenure forState:UIControlStateNormal];
}

- (IBAction)btnSubmitClicked:(id)sender
{
    if ([txtMonthlyIncome.text length]!=0 && [txtMonthlyRepaymentNonProperty.text length]!=0 && [txtMonthlyRepaymentProperty.text length]!=0 && [txtInterestRate.text length]!=0 && [txtLoanAmount.text length]!=0 && [strLoanTenure length]!=0) {
        
        NSInteger years = [strLoanTenure intValue];
        double interestRate = [txtInterestRate.text floatValue]/(100*12);
        float z = pow(1+interestRate,-years*12);
        
        NSLog(@"%f",z);
        
        double result = [txtLoanAmount.text floatValue] * (interestRate/(1-z));
        
        double threshold = 0.6 * ([txtMonthlyIncome.text floatValue]-[txtMonthlyRepaymentNonProperty.text floatValue]-[txtMonthlyRepaymentProperty.text floatValue]);
        
        NSLog(@"%f",result);
        ResultsViewController * objResults = [[ResultsViewController alloc]initWithResult:result withThreshold:threshold];
        [self.navigationController pushViewController:objResults animated:YES];

    }
    else {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Please Fill in All Data" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
