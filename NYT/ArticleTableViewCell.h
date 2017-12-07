//
//  ArticleTableViewCell.h
//  NYT
//
//  Created by istvbagi on 2017. 12. 07..
//  Copyright © 2017. misys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *details;

@end
