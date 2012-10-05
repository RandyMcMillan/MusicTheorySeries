//

//  MasterViewController.h
//  MT101
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "UIImage+PDF.h"
#import "EGORefreshTableHeaderView.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <EGORefreshTableHeaderDelegate>{
    EGORefreshTableHeaderView *_refreshHeaderView;

    //  Reloading var should really be your tableviews datasource
    //  Putting it here for demo purposes
    BOOL _reloading;

    NSArray *videoList0;
    NSArray *videoList1;
    NSArray *videoList2;
    NSArray *videoList3;
    NSArray *videoList4;
    NSArray *videoList5;

    NSArray *imageNameList0;
    NSArray *imageNameList1;
    NSArray *imageNameList2;
    NSArray *imageNameList3;
    NSArray *imageNameList4;
    NSArray *imageNameList5;

    NSArray *imageList0;
    NSArray *imageList1;
    NSArray *imageList2;
    NSArray *imageList3;
    NSArray *imageList4;
    NSArray *imageList5;

    NSArray *interactiveList0;
    NSArray *interactiveList1;
    NSArray *interactiveList2;
    NSArray *interactiveList3;
    NSArray *interactiveList4;
    NSArray *interactiveList5;

    NSArray *wikiToDiplayList0;
    NSArray *wikiToDiplayList1;
    NSArray *wikiToDiplayList2;
    NSArray *wikiToDiplayList3;
    NSArray *wikiToDiplayList4;
    NSArray *wikiToDiplayList5;

    NSArray *youtubeToDiplayList0;
    NSArray *youtubeToDiplayList1;
    NSArray *youtubeToDiplayList2;
    NSArray *youtubeToDiplayList3;
    NSArray *youtubeToDiplayList4;
    NSArray *youtubeToDiplayList5;

    NSArray *sectionHeader;
}

@property (strong,
    nonatomic) DetailViewController *detailViewController;

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end
