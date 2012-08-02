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
    
    NSArray *videoList;
    NSArray *imageList;
    NSArray *interactiveList;
    
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
