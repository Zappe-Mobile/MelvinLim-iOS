//
//  HomeViewController.m
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "HomeViewController.h"
#import "ImageCollectionViewCell.h"
#import "UINavigationController+Extras.h"

@interface HomeViewController () <MFMailComposeViewControllerDelegate>
{
    IBOutlet UICollectionView * imageCollectionView;
    IBOutlet UIPageControl * imagePageControl;
    
    IBOutlet UIButton * callUsButton;
    IBOutlet UIButton * emailUsButton;
    
    NSMutableArray * arrayImages;
}
@end

@implementation HomeViewController

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
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"Melvin Lim"];
    
    arrayImages = [[NSMutableArray alloc]initWithObjects:@"melvin.png",@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",nil];
    
    [imageCollectionView registerNib:[UINib nibWithNibName:@"ImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ImageCollectionViewCell"];

    [self->imageCollectionView reloadData];
    [self->imageCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]
                                  animated:NO
                            scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];

}

#pragma mark - UICollectionViewDataSource Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [arrayImages count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionViewCell" forIndexPath:indexPath];
    cell.imageHome.image = [UIImage imageNamed:[arrayImages objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [imageCollectionView scrollToItemAtIndexPath:indexPath
                     atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                             animated:YES];
    imagePageControl.currentPage = indexPath.row;

    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    imageCollectionView = nil;
    imagePageControl = nil;
    
    callUsButton = nil;
    emailUsButton = nil;
    
    arrayImages = nil;
}
@end
