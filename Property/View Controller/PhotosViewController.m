//
//  PhotosViewController.m
//  Property
//
//  Created by Roman Khan on 06/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "PhotosViewController.h"
#import "UINavigationController+Extras.h"
#import "PhotosCollectionViewCell.h"

@interface PhotosViewController ()
{
    IBOutlet UIImageView * imgFullPhoto;
    IBOutlet UICollectionView * thumbnailCollectionView;
    
    NSMutableArray * arrayImages;
}
@end

@implementation PhotosViewController

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
    
    self.navigationItem.titleView = [self.navigationController setTitleView:@"Photos"];
    
    arrayImages = [[NSMutableArray alloc]initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"1.jpg",@"2.jpg",@"3.jpg",nil];
    
    [thumbnailCollectionView registerNib:[UINib nibWithNibName:@"PhotosCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PhotosCollectionViewCell"];
    

    imgFullPhoto.image = [UIImage imageNamed:@"1.jpg"];
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
    
    PhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotosCollectionViewCell" forIndexPath:indexPath];
    cell.imageThumbnail.image = [UIImage imageNamed:[arrayImages objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    imgFullPhoto.image = [UIImage imageNamed:[arrayImages objectAtIndex:indexPath.row]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    imgFullPhoto = nil;
    thumbnailCollectionView = nil;
    
    arrayImages = nil;
}
@end
