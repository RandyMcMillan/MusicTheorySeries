//
//  DetailViewController.h
//  MT101
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
//#import "AppleXylophoneViewController.h"
//#import "GrandStaffViewController.h"
//#import "AeolianViewController.h"
//#import "CircleOfFifthsViewController.h"
//#import "TrebleClefViewController.h"
@class ColorUIButton;

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong,nonatomic) id detailItem;

@property (strong,nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong,nonatomic) IBOutlet UILabel *musicTheory101Label;
@property (strong,nonatomic) IBOutlet UILabel *vLabel;

@property(nonatomic,retain) NSString *MovieToPlay;
@property(nonatomic,retain) IBOutlet UIImageView *imageView;
@property(nonatomic,retain) IBOutlet NSString *interactiveToDisplay;
@property(nonatomic,retain) NSString *wikiToDisplay;
@property(nonatomic,retain) IBOutlet UIToolbar *toolBar;

//@property(nonatomic,retain) IBOutlet AppleXylophoneViewController *viewController;
//@property(nonatomic,retain) IBOutlet AeolianViewController *aeolianVC;
//@property(nonatomic,retain) IBOutlet GrandStaffViewController *grandStaffVC;
//@property(nonatomic,retain) IBOutlet CircleOfFifthsViewController *circleOfFifthsVC;
//@property(nonatomic,retain) IBOutlet TrebleClefViewController *trebleClefVC;

@property (retain, nonatomic) IBOutlet ColorUIButton *testButton;
@property (retain, nonatomic) IBOutlet ColorUIButton *redButton;
@property (retain, nonatomic) IBOutlet ColorUIButton *greenButton;
@property (retain, nonatomic) IBOutlet ColorUIButton *blueButton;
@property (retain, nonatomic) IBOutlet ColorUIButton *brownRedButton;
@property (retain, nonatomic) IBOutlet ColorUIButton *cornerRadiusButton;
@property (retain, nonatomic) IBOutlet ColorUIButton *border5Button;
@property (retain, nonatomic) IBOutlet ColorUIButton *crazyButton;

-(IBAction)clickMe:(UIButton *)sender;

-(IBAction)displayInteractive:(id)sender;
-(IBAction)displayWiki:(id)sender;
-(IBAction)playMovie:(id)sender;

@end
