//
//  AppointmentViewController.m
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "AppointmentViewController.h"
#import "UINavigationController+Extras.h"
#import "ZPickerView.h"

@interface AppointmentViewController () <MFMailComposeViewControllerDelegate>
{
    IBOutlet UIScrollView * appointmentScrollView;
    
    IBOutlet UITextField * txtName;
    IBOutlet UITextField * txtContactNo;
    IBOutlet UITextField * txtEmailId;
    IBOutlet UITextField * txtAddress;
    
    IBOutlet UIButton * btnAppointmentDate;
    IBOutlet UIButton * btnAppointmentTime;
    IBOutlet UIButton * btnSubmit;
    
    NSString * selectedDate;
    NSString * selectedTime;
}
@property (strong, nonatomic) ZPickerView * containerView;
@end

@implementation AppointmentViewController

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
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"Make An Appointment"];
}

- (IBAction)appointmentDateButtonClicked:(id)sender
{
    [txtName resignFirstResponder];
    [txtAddress resignFirstResponder];
    [txtContactNo resignFirstResponder];
    [txtEmailId resignFirstResponder];
    
    _containerView = [[NSBundle mainBundle] loadNibNamed:@"ZPickerView" owner:self options:nil][0];
    _containerView.frame = CGRectMake(0, 0, 320, 568);
    [_containerView loadDataForPickerType:PickerTypeDate];
    _containerView.delegate = self;
    [self.view addSubview:_containerView];

}

- (IBAction)appointmentTimeButtonClicked:(id)sender
{
    [txtName resignFirstResponder];
    [txtAddress resignFirstResponder];
    [txtContactNo resignFirstResponder];
    [txtEmailId resignFirstResponder];

    _containerView = [[NSBundle mainBundle] loadNibNamed:@"ZPickerView" owner:self options:nil][0];
    _containerView.frame = CGRectMake(0, 0, 320, 568);
    [_containerView loadDataForPickerType:PickerTypeTime];
    _containerView.delegate = self;
    [self.view addSubview:_containerView];

}


- (void)setSelectedValue:(NSString *)value WithSelectedId:(NSString *)selectedId WithPickerType:(DatePickerType)pickerType
{
    switch (pickerType) {
        case PickerTypeDate:
        {
            selectedDate = value;
            [btnAppointmentDate setTitle:selectedDate forState:UIControlStateNormal];
        }
            break;
        case PickerTypeTime:
        {
            selectedTime = value;
            [btnAppointmentTime setTitle:selectedTime forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
}

- (IBAction)submitButtonClicked:(id)sender
{
    if ([txtName.text length]!=0 && [txtContactNo.text length]!=0 && [txtEmailId.text length]!=0 && [txtAddress.text length]!=0 && [selectedDate length]!=0 && [selectedTime length]!=0) {
        
        if([MFMailComposeViewController canSendMail])
        {
            MFMailComposeViewController *EmailPicker = [[MFMailComposeViewController alloc] init];
            EmailPicker.mailComposeDelegate = self;
            
            NSString * strBody = [NSString stringWithFormat:@"Name : %@\nContact No : %@\nEmail ID : %@\nAddress : %@\nDate : %@\nTime : %@",txtName.text,txtContactNo.text,txtEmailId.text,txtAddress.text,selectedDate,selectedTime];
            [EmailPicker setMessageBody:strBody isHTML:NO];
            
            [self presentViewController:EmailPicker animated:YES completion:nil];
            
        }

    }
    else {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Please Fill in All Data" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    appointmentScrollView = nil;
    
    txtName = nil;
    txtContactNo = nil;
    txtEmailId = nil;
    txtAddress = nil;
    
    btnAppointmentDate = nil;
    btnAppointmentTime = nil;
    btnSubmit = nil;
}

@end
