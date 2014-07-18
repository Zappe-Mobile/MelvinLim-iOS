//
//  UINavigationController+Extras.m
//  Property
//
//  Created by Roman Khan on 07/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#import "UINavigationController+Extras.h"

@implementation UINavigationController (Extras)

-(UILabel *)setTitleView:(NSString *)title
{
    UILabel * lblTitle = [[UILabel alloc]init];
    lblTitle.frame = CGRectMake(0, 0, 40, 25);
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.textColor = [UIColor whiteColor];
    lblTitle.text = title;
    lblTitle.font = [UIFont fontWithName:@"Arial" size:18];
    
    return lblTitle;
    
}

@end
