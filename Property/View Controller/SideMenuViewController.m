//
//  SideMenuViewController.m
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "SideMenuViewController.h"
#import "HomeViewController.h"
#import "TDSRCalculatorViewController.h"
#import "PropertyOnlineViewController.h"
#import "AppointmentViewController.h"
#import "WebsiteViewController.h"
#import "FacebookViewController.h"
#import "TestimonialsViewController.h"
#import "PhotosViewController.h"
#import "FAQViewController.h"
#import "ContactUsViewController.h"
#import "FeedsViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "PStringConstants.h"

@interface SideMenuViewController ()
{
    IBOutlet UITableView * tblMenu;
    
    NSMutableArray * arrayMenu;
    NSMutableArray * arrayImages;
}
@end

@implementation SideMenuViewController

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
    
    arrayMenu = [[NSMutableArray alloc]initWithObjects:
                                        @"Home",
                                        @"TDSR Calculator",
                                        @"Make An Appointment",
                                        @"Website",
                                        @"Facebook",
                                        @"Testimonials",
                                        @"Photos",
                                        @"FAQ",
                                        @"Contact Us",
                                        @"Feeds",nil];
    
    arrayImages = [[NSMutableArray alloc]initWithObjects:
                                            @"icon_Home",
                                            @"icon_TDSR",
                                            @"icon_Appointment",
                                            @"icon_Website",
                                            @"icon_Facebook",
                                            @"icon_Testimonials",
                                            @"icon_Photos",
                                            @"icon_FAQ",
                                            @"icon_ContactUs",
                                            @"icon_ContactUs",nil];
}

#pragma mark - Table View Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arrayMenu count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tv viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [UIColor blackColor];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text= [arrayMenu objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    cell.imageView.image = [UIImage imageNamed:[arrayImages objectAtIndex:indexPath.row]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            //! Home Screen
            UINavigationController * homeNav = [[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc]init]];
            self.sidePanelController.centerPanel = homeNav;
        }
            break;

        case 1:
        {
            //! TDSR Calculator Screen
            UINavigationController * homeNav = [[UINavigationController alloc] initWithRootViewController:[[TDSRCalculatorViewController alloc]init]];
            self.sidePanelController.centerPanel = homeNav;
        }
            break;
            
        case 2:
        {
            //! Make An Appointment Screen
            UINavigationController * productNav = [[UINavigationController alloc] initWithRootViewController:[[AppointmentViewController alloc]init]];
            self.sidePanelController.centerPanel = productNav;
        }
            break;
        case 3:
        {
            //! Website Screen
            UINavigationController * productNav = [[UINavigationController alloc] initWithRootViewController:[[WebsiteViewController alloc]init]];
            self.sidePanelController.centerPanel = productNav;
        }
            break;
        case 4:
        {
            //! Facebook Screen
            UINavigationController * promotionNav = [[UINavigationController alloc] initWithRootViewController:[[FacebookViewController alloc]init]];
            self.sidePanelController.centerPanel = promotionNav;
        }
            break;
        case 5:
        {
            //! Testimonials Screen
            UINavigationController * shoppingNav = [[UINavigationController alloc] initWithRootViewController:[[TestimonialsViewController alloc]init]];
            self.sidePanelController.centerPanel = shoppingNav;
        }
            break;
        case 6:
        {
            //! Photos Screen
            UINavigationController * wishlistNav = [[UINavigationController alloc] initWithRootViewController:[[PhotosViewController alloc]init]];
            self.sidePanelController.centerPanel = wishlistNav;
            
        }
            break;
        case 7:
        {
            //! FAQs Screen
            UINavigationController * wheretobuyNav = [[UINavigationController alloc] initWithRootViewController:[[FAQViewController alloc]init]];
            self.sidePanelController.centerPanel = wheretobuyNav;
            
        }
            break;
        case 8:
        {
            //! Contact Us Screen
            UINavigationController * medicationNav = [[UINavigationController alloc] initWithRootViewController:[[ContactUsViewController alloc]init]];
            self.sidePanelController.centerPanel = medicationNav;
            
        }
            break;
        case 9:
        {
            //! Feeds Screen
            UINavigationController * feedsNav = [[UINavigationController alloc] initWithRootViewController:[[FeedsViewController alloc]init]];
            self.sidePanelController.centerPanel = feedsNav;
        }
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    tblMenu = nil;
    
    arrayMenu = nil;
}
@end
