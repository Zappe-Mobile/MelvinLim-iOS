//
//  FAQViewController.m
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "FAQViewController.h"
#import "UINavigationController+Extras.h"

@interface FAQViewController ()
{
    IBOutlet UITableView * tblFAQ;
    
    NSMutableArray * arrayFAQ;
}
@end

@implementation FAQViewController

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
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"FAQs"];
    
    
    arrayFAQ = [[NSMutableArray alloc]initWithObjects:
                @"Q: Lorem ipsum Lorem ipsum Loren ipsum \nA: Lorem ipsum Lorem ipsum Loren ipsum Lorem ipsum Lorem ipsum Loren ipsum Lorem ipsum Lorem ipsum Loren ipsum Lorem ipsum",
                @"Q: Lorem ipsum Lorem ipsum Loren ipsum \nA: Lorem ipsum Lorem ipsum Loren ipsum Lorem ipsum Lorem ipsum Loren ipsum Lorem ipsum Lorem ipsum Loren ipsum Lorem ipsum",
                @"Q: Lorem ipsum Lorem ipsum Loren ipsum \nA: Lorem ipsum Lorem ipsum Loren ipsum Lorem ipsum Lorem ipsum Loren ipsum Lorem ipsum Lorem ipsum Loren ipsum Lorem ipsum", nil];
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
    return [arrayFAQ count];
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
    cell.textLabel.text= [arrayFAQ objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    
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

- (void)dealloc
{
    tblFAQ = nil;
}
@end
