//
//  ContactUsViewController.m
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "ContactUsViewController.h"
#import "UINavigationController+Extras.h"
#import "WebpageViewController.h"

@interface ContactUsViewController () <MFMailComposeViewControllerDelegate>
{
    IBOutlet MKMapView * contactMapView;
    
    IBOutlet UIButton * callUsButton;
    IBOutlet UIButton * emailUsButton;
    IBOutlet UIButton * websiteButton;
}
@end

@implementation ContactUsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//! 1.331626,103.84941
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"Contact Us"];
    
    
    MKCoordinateSpan span;
    span.latitudeDelta=0.05;
    span.longitudeDelta=0.05;
    
    MKCoordinateRegion region;
    region.center.latitude = 1.331626;
    region.center.longitude = 103.84941;
    
    region.span = span;
    
    [contactMapView setRegion:region];

}

/**
 *  Call Us Functionality
 *
 *  @param sender Button Object
 */
- (IBAction)callUsButtonClicked:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://+6596667978"]];
}

/**
 *  Email Us Functionality
 *
 *  @param sender Button Object
 */
- (IBAction)emailUsButtonClicked:(id)sender
{
    if([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *EmailPicker = [[MFMailComposeViewController alloc] init];
        EmailPicker.mailComposeDelegate = self;
        
        [EmailPicker setToRecipients:[NSArray arrayWithObject:@"melvin.teampower@gmail.com"]];
        
        [self presentViewController:EmailPicker animated:YES completion:nil];
        
    }

}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    NSString *msg1;
    switch (result)
    {
        case MFMailComposeResultCancelled:
            msg1 =@"Sending Mail is cancelled";
            break;
        case MFMailComposeResultSaved:
            msg1=@"Sending Mail is Saved";
            break;
        case MFMailComposeResultSent:
            msg1 =@"Your Mail has been sent successfully";
            break;
        case MFMailComposeResultFailed:
            msg1 =@"Message sending failed";
            break;
        default:
            msg1 =@"Your Mail is not Sent";
            break;
    }
    UIAlertView *mailResuletAlert = [[UIAlertView alloc]initWithFrame:CGRectMake(10, 170, 300, 120)];
    mailResuletAlert.message=msg1;
    mailResuletAlert.title=@"Message";
    [mailResuletAlert addButtonWithTitle:@"OK"];
    [mailResuletAlert show];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  Website Functionality
 *
 *  @param sender Button Object
 */
- (IBAction)websiteButtonClicked:(id)sender
{
    WebpageViewController * webpageObj = [[WebpageViewController alloc]init];
    [self.navigationController pushViewController:webpageObj animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    contactMapView = nil;
    
    callUsButton = nil;
    emailUsButton = nil;
    websiteButton = nil;
}
@end
