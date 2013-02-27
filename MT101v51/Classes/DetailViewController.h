//
//  DetailViewController.h
//  MGSplitView
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright Instinctive Code 2010.
//

#import <UIKit/UIKit.h>
#import "MGSplitViewController.h"
#import "MixerHostAudio.h"

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, MGSplitViewControllerDelegate>{
	IBOutlet MGSplitViewController	*splitController;
	IBOutlet UIBarButtonItem		*toggleItem;
	IBOutlet UIBarButtonItem		*verticalItem;
	IBOutlet UIBarButtonItem		*dividerStyleItem;
	IBOutlet UIBarButtonItem		*masterBeforeDetailItem;
	IBOutlet UITableView			*tableView;
	UIPopoverController				*popoverController;
	UIToolbar						*toolbar;

	id		detailItem;
	UILabel *detailDescriptionLabel;

	int		lastKeyIndex;
	CGRect	keyRects[KEY_COUNT];

	IBOutlet UIButton	*button0;
	}

@property (nonatomic, retain) IBOutlet UIToolbar	*toolbar;
@property (nonatomic, retain) id					detailItem;
@property (nonatomic, retain) IBOutlet UILabel		*detailDescriptionLabel;

@property (nonatomic, retain) IBOutlet UIView	*viewA;
@property (nonatomic, retain) IBOutlet UIView	*viewB;

@property (nonatomic, retain) IBOutlet UIImageView	*imageViewA;
@property (nonatomic, retain) IBOutlet UIImageView	*imageViewB;
@property (nonatomic, retain) IBOutlet UITableView	*tableView;

- (IBAction)toggleMasterView:(id)sender;
- (IBAction)toggleVertical:(id)sender;
- (IBAction)toggleDividerStyle:(id)sender;
- (IBAction)toggleMasterBeforeDetail:(id)sender;

@property (nonatomic, assign) MixerHostAudio *mixerHost;
- (int)keyIndexForTouch:(UITouch *)touch;
- (IBAction)mixerOutputGainChanged:(UISlider *)sender;
- (void)drawRects:(NSIndexPath *)indexPath;
@property (nonatomic,readwrite) BOOL isShowingLandscapeView;


- (IBAction)playNote:(id)sender;



@end
