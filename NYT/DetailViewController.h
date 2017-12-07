//
//  DetailViewController.h
//  NYT
//
//  Created by istvbagi on 2017. 12. 07..
//  Copyright © 2017. misys. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWGArticle;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) SWGArticle *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

