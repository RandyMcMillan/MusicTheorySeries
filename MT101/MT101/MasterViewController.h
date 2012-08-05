//
//  MasterViewController.h
//  MT101
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController{
   
    NSArray *videoList0;
    NSArray *videoList1;
    NSArray *videoList2;
    NSArray *videoList3;
    NSArray *videoList4;
    NSArray *videoList5;

    NSArray *imageList;
    NSArray *interactiveList;
    NSArray *sectionHeader;
    
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
