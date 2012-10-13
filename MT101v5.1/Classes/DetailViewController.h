//
//  DetailViewController.h
//  MT101v5.1
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright Instinctive Code 2010.
//

#import <UIKit/UIKit.h>
#import "MT101v5.1Controller.h"

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, MT101v5.1ControllerDelegate> {
	IBOutlet MT101v5.1Controller *splitController;
	IBOutlet UIBarButtonItem *toggleItem;
	IBOutlet UIBarButtonItem *verticalItem;
	IBOutlet UIBarButtonItem *dividerStyleItem;
	IBOutlet UIBarButtonItem *masterBeforeDetailItem;
    UIPopoverController *popoverController;
    UIToolbar *toolbar;
    
    id detailItem;
    UILabel *detailDescriptionLabel;
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) id detailItem;
@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)toggleMasterView:(id)sender;
- (IBAction)toggleVertical:(id)sender;
- (IBAction)toggleDividerStyle:(id)sender;
- (IBAction)toggleMasterBeforeDetail:(id)sender;

@end
