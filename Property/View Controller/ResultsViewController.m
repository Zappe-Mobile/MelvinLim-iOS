//
//  ResultsViewController.m
//  Property
//
//  Created by rkhan-mbook on 17/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "ResultsViewController.h"
#import "UINavigationController+Extras.h"

@interface ResultsViewController ()
{
    double finalResult;
    double finalThreshold;
    
    IBOutlet UILabel * lblThreshold;
    IBOutlet UILabel * lblRepayment;
    IBOutlet UILabel * lblTDSR;
}
@end

@implementation ResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithResult:(float)result withThreshold:(float)threshold
{
    self = [super init];
    if (self) {
        
        finalResult = result;
        finalThreshold = threshold;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"TDSR Results"];
    self.navigationItem.leftBarButtonItem = [self setLeftBarButton];
    NSLog(@"%f",finalResult);
    
    lblThreshold.text = [NSString stringWithFormat:@"%f",finalThreshold];
    lblRepayment.text = [NSString stringWithFormat:@"%f",finalResult];
    
    if (finalResult < finalThreshold) {
        lblTDSR.text = @"YES";
        lblTDSR.textColor = [UIColor greenColor];
    }
    else {
        lblTDSR.text = @"NO";
        lblTDSR.textColor = [UIColor redColor];
    }
    
}


#pragma mark - Set Navigation Bar Left Button
//! Set Left Bar Button
- (UIBarButtonItem *)setLeftBarButton
{
    UIButton * btnSettings = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSettings.frame = CGRectMake(0, 0, 20, 20);
    [btnSettings setImage:[UIImage imageNamed:@"navbar_btn_back@2x.png"] forState:UIControlStateNormal];
    [btnSettings addTarget:self action:@selector(btnLeftBarClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barBtnItem = [[UIBarButtonItem alloc]initWithCustomView:btnSettings];
    
    return barBtnItem;
}

#pragma mark - Navigation Bar Left Button Selector
//! Method invoked when left bar button clicked
- (void)btnLeftBarClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
