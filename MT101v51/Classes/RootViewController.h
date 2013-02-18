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
    NSArray *imageList2;
    NSArray *imageList3;
    NSArray *imageList4;
    NSArray *imageList5;
    BOOL isCircleView;

}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;
@property (nonatomic, assign) BOOL	 isCircleView;

- (void)selectFirstRow;
- (void)layOut;
- (void)layoutImageView;
- (void)layoutCircleView;

@end
