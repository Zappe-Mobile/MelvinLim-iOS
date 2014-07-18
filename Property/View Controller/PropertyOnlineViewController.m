//
//  PropertyOnlineViewController.m
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "PropertyOnlineViewController.h"
#import "UINavigationController+Extras.h"

@interface PropertyOnlineViewController ()

@end

@implementation PropertyOnlineViewController

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
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"Property Online"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
