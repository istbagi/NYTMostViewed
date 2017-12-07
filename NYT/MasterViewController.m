//
//  MasterViewController.m
//  NYT
//
//  Created by istvbagi on 2017. 12. 07..
//  Copyright © 2017. misys. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ArticleTableViewCell.h"

#import <SwaggerClientNYT/SWGDefaultConfiguration.h>
#import <SwaggerClientNYT/SWGDefaultApi.h>
#import <SwaggerClientNYT/SWGArticle.h>
#import <SwaggerClientNYT/SWGLogger.h>

@interface MasterViewController ()

@property NSMutableArray *objects;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    SWGDefaultConfiguration *configuration = [SWGDefaultConfiguration sharedConfig];
    [configuration setApiKey:@"9d850e567eab4fd59155686c651d3d77" forApiKeyIdentifier:@"api-key"];
    configuration.logger = [[SWGLogger alloc] init];
    SWGDefaultApi *defaultApi = [SWGDefaultApi new];

    __weak typeof(self) weakSelf = self;
    [defaultApi gETMostviewedSectionTimePeriodJsonWithSection:@"all-sections" timePeriod:@"7" completionHandler:^(SWGInlineResponse200 *output, NSError *error) {

        if (!error)
        {
            typeof(self) self = weakSelf;
            self.objects = [NSMutableArray arrayWithArray:output.results];
            [self.tableView reloadData];
        }
    }];

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SWGArticle *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleTableViewCell *cell = (id)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    SWGArticle *object = self.objects[indexPath.row];
    cell.title.text = object.title;
    cell.details.text = object.byline;

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//    {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//    else if (editingStyle == UITableViewCellEditingStyleInsert)
//    {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

@end
