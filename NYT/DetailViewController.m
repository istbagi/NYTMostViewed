//
//  DetailViewController.m
//  NYT
//
//  Created by istvbagi on 2017. 12. 07..
//  Copyright © 2017. misys. All rights reserved.
//

#import "DetailViewController.h"

#import <SwaggerClientNYT/SWGArticle.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem)
    {
        self.detailDescriptionLabel.text = self.detailItem.abstract;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(SWGArticle *)newDetailItem
{
    if (_detailItem != newDetailItem)
    {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
