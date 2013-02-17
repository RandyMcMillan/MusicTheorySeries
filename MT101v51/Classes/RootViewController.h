//
//  RootViewController.h
//  MGSplitView
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright Instinctive Code 2010.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController {
	DetailViewController *detailViewController;
    
    NSArray *rootSection;
    NSArray *rootVCIcon;
    NSArray *imageList0;
    NSArray *imageList1;


}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

- (void)selectFirstRow;

@end
