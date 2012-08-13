//
//  DetailViewController.h
//  MT101
//
//  Created by David McMahon on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "AppleXylophoneViewController.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property(nonatomic, retain) NSString *MovieToPlay;
@property(nonatomic,retain) IBOutlet UIImageView *imageView;
@property(nonatomic,retain) IBOutlet UIToolbar *toolBar;
@property (nonatomic, retain) IBOutlet AppleXylophoneViewController *viewController;

-(IBAction)displayInteractive:(id)sender;
-(IBAction)playMovie:(id)sender;

@end