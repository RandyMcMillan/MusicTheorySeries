//
//  DetailViewController.h
//  MT101
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "AppleXylophoneViewController.h"
#import "AeolianViewController.h"
#import "CircleOfFifthsViewController.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong,nonatomic) id detailItem;

@property (strong,nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property(nonatomic,retain) NSString *MovieToPlay;
@property(nonatomic,retain) IBOutlet UIImageView *imageView;
@property(nonatomic,retain) IBOutlet NSString *interactiveToDisplay;
@property(nonatomic,retain) IBOutlet UIToolbar *toolBar;

@property(nonatomic,retain) IBOutlet AppleXylophoneViewController *viewController;
@property(nonatomic,retain) IBOutlet AeolianViewController *aeolianVC;
@property(nonatomic,retain) IBOutlet CircleOfFifthsViewController *circleOfFifthsVC;



-(IBAction)displayInteractive:(id)sender;
-(IBAction)playMovie:(id)sender;

@end
