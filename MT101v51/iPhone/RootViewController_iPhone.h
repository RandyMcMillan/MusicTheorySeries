//
//  RootViewController_iPhone.h
//  MGSplitView
//
//  Created by Randy McMillan on 11/17/12.
//
//

#import <UIKit/UIKit.h>

@class DetailViewController_iPhone;

@interface RootViewController_iPhone : UITableViewController {
	DetailViewController_iPhone *detailViewController_iPhone;
}

@property (nonatomic, retain) IBOutlet DetailViewController_iPhone *detailViewController_iPhone;

- (void)selectFirstRow;

@end
