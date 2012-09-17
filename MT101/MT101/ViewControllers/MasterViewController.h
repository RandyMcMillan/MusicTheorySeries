//
//  MasterViewController.h
//  MT101
//
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController {
    NSArray *videoList;
    NSArray *imageList;
    NSArray *interactiveList;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
