//
//  SearchControllerViewController.h
//  AWSECDemoApp
//
//  Created by bulldog on 13-3-22.
//  Copyright (c) 2013 Leansoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailsViewController;

@interface SearchViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate> {
    // container halding search results;
    NSMutableArray *_tableData;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) DetailsViewController *detailsViewController;

@end
