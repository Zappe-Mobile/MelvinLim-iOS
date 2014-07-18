//
//  WebsiteViewController.m
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "WebsiteViewController.h"
#import "UINavigationController+Extras.h"
#import "NJKWebViewProgress.h"

@interface WebsiteViewController ()
{
    IBOutlet UIWebView * webpageWebview;
}
@end

@implementation WebsiteViewController

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
    
    NSURL * url = [NSURL URLWithString:@"http://www.teampower.sg/"];
    NSURLRequest * urlReq = [NSURLRequest requestWithURL:url];
    [webpageWebview loadRequest:urlReq];
    [webpageWebview scalesPageToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    webpageWebview = nil;
}
@end
