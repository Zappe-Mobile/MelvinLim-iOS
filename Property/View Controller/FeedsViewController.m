//
//  FeedsViewController.m
//  Property
//
//  Created by rkhan-mbook on 09/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "FeedsViewController.h"
#import "RequestManager.h"
#import "DataManager.h"
#import "Feeds.h"
#import "UINavigationController+Extras.h"
#import "FeedCell.h"

@interface FeedsViewController ()
{
    IBOutlet UITableView * tblFeeds;
    NSMutableArray * feedsArray;
}
@end

@implementation FeedsViewController

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
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"Property Listing"];

    feedsArray = [[NSMutableArray alloc]init];
    
    [[RequestManager sharedManager]fetchFeedsWithCompletionBlock:^(BOOL result, id resultObject) {
        
        if (result) {
            
            NSLog(@"%@",resultObject);
            [DataManager storeFeedDataWithArray:resultObject withDataBlock:^(BOOL success, NSError *error) {
               
                if (success) {
                    
                    feedsArray = [DataManager fetchAllFeedsFromCoreData];
                    [tblFeeds reloadData];
                }
                else {
                    
                }
            }];
            
        }
        else {
            
        }
    }];
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
    return [feedsArray count];
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
    FeedCell * cell=(FeedCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FeedCell" owner:nil options:nil];
        cell = (FeedCell *)[nib objectAtIndex:0];
        
        cell.backgroundView.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        
        
    }
    
    // Configure the cell...
    Feeds * feedObject = feedsArray[indexPath.row];
    cell.titleLabel.text= feedObject.propertyTitle;
    cell.categoryLabel.text = feedObject.propertyCategory;
    cell.descriptionLabel.text = feedObject.propertyDescription;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
