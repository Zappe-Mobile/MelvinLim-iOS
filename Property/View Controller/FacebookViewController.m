//
//  FacebookViewController.m
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "FacebookViewController.h"
#import "UINavigationController+Extras.h"
#import "NJKWebViewProgress.h"

@interface FacebookViewController ()
{
    IBOutlet UIWebView * facebookWebview;
}
@end

@implementation FacebookViewController

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
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"Facebook"];
    
    NSURL * url = [NSURL URLWithString:@"https://www.facebook.com/melvinlimproperty"];
    NSURLRequest * urlReq = [NSURLRequest requestWithURL:url];
    [facebookWebview loadRequest:urlReq];
    [facebookWebview scalesPageToFit];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    facebookWebview = nil;
}
@end
