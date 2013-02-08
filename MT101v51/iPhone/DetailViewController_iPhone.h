//
//  DetailViewController_iPhone.h
//  MGSplitView
//
//  Created by Randy McMillan on 1/1/13.
//
//

#import <UIKit/UIKit.h>
#import "MGSplitViewController.h"

@interface DetailViewController_iPhone : UIViewController <MGSplitViewControllerDelegate>{
	UIToolbar *toolbar;

	id		detailItem;
	UILabel *detailDescriptionLabel;
}

@property (nonatomic, retain) IBOutlet UIToolbar	*toolbar;
@property (nonatomic, retain) id					detailItem;
@property (nonatomic, retain) IBOutlet UILabel		*detailDescriptionLabel;
@property (nonatomic, retain) IBOutlet UIView		*viewA;
@property (nonatomic, retain) IBOutlet UIView		*viewB;

@property (nonatomic, retain) IBOutlet UIImageView	*imageViewA;
@property (nonatomic, retain) IBOutlet UIImageView	*imageViewB;
@property (nonatomic, retain) IBOutlet UITableView	*tableView;

- (void)layoutSubViews;

@end
