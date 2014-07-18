//
//  WebpageViewController.m
//  Property
//
//  Created by rkhan-mbook on 07/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "WebpageViewController.h"
#import "NJKWebViewProgress.h"
#import "UINavigationController+Extras.h"

@interface WebpageViewController ()
{
    IBOutlet UIWebView * webpageWebview;
}
@end

@implementation WebpageViewController

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
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"Website"];
    self.navigationItem.leftBarButtonItem = [self setLeftBarButton];
    
    NSURL * url = [NSURL URLWithString:@"http://www.teampower.sg/"];
    NSURLRequest * urlReq = [NSURLRequest requestWithURL:url];
    [webpageWebview loadRequest:urlReq];
    [webpageWebview scalesPageToFit];

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
