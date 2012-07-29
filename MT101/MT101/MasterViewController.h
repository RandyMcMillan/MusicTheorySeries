//
//  MasterViewController.h
//  MT101
//
//  Created by David McMahon on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController{
    
    NSArray *videoList;
    NSArray *imageList;
    NSArray *viewList;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
