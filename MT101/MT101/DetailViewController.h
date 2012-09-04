//

//  DetailViewController.h
//  MT101
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "GradientButton.h"
#import "GradientToolBar.h"
#import "ExampleView.h"


@interface DetailViewController : UIViewController <
  UISplitViewControllerDelegate> {

  GradientButton    *videoButton;
  GradientButton    *wikiButton;
  GradientButton    *interActiveButton;
  GradientToolBar   *toolBar;
      ExampleView *imageView;

}

@property (strong,nonatomic) id detailItem;

@property (strong,nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong,nonatomic) IBOutlet UILabel *musicTheory101Label;
@property (strong,nonatomic) IBOutlet UILabel *vLabel;

@property (nonatomic,retain) NSString *MovieToPlay;
@property (nonatomic,retain) IBOutlet ExampleView *imageView;
@property (nonatomic,retain) IBOutlet NSString *interactiveToDisplay;
@property (nonatomic,retain) NSString *wikiToDisplay;

@property (nonatomic,retain) IBOutlet  GradientButton *videoButton;
@property (nonatomic,retain) IBOutlet  GradientButton *wikiButton;
@property (nonatomic,retain) IBOutlet  GradientButton *interActiveButton;
@property (nonatomic, retain) IBOutlet GradientToolBar *toolBar;

-(IBAction)clickMe:(UIButton *)sender;

-(IBAction)displayInteractive:(id)sender;
-(IBAction)displayWiki:(id)sender;
-(IBAction)playMovie:(id)sender;

@end
