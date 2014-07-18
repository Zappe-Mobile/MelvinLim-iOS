//
//  FeedCell.h
//  Property
//
//  Created by rkhan-mbook on 09/07/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel * titleLabel;
@property (nonatomic, strong) IBOutlet UILabel * categoryLabel;
@property (nonatomic, strong) IBOutlet UILabel * descriptionLabel;
@property (nonatomic, strong) IBOutlet UILabel * linkLabel;
@end
