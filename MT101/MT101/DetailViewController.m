//
//  DetailViewController.m
//  MT101
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import "DetailViewController.h"

#import "GrandStaffViewController.h"
#import "AppleXylophoneViewController.h"
#import "CircleOfFifthsViewController.h"
#import "TrebleClefViewController.h"
#import "SopranoClefViewController.h"
#import "MezzoSopranoClefViewController.h"
#import "AltoClefViewController.h"
#import "TenorClefViewController.h"
#import "BariToneClefViewController.h"
#import "BassClefViewController.h"
#import "SubBassClefViewController.h"

#import "AeolianViewController.h"


@interface DetailViewController (){
    
    MPMoviePlayerViewController *moviePlayer;
 // AppleXylophoneViewController *test;
 // AeolianViewController *aeolianVC;
 // GrandStaffViewController *theGrandStaffVC;
 // CircleOfFifthsViewController *circleOfFifthsVC;
 // TrebleClefViewController *trebleClefVC;
    
}
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;

@synthesize imageView,MovieToPlay,interactiveToDisplay;

#pragma mark - Managing the detail item
#pragma mark - displayInteractives

-(IBAction)displayInteractive:(id)sender{
    
    NSLog(@"interactiveToDisplay = %@ ",interactiveToDisplay);

    if (interactiveToDisplay == @"GrandStaffViewController") {
        
        GrandStaffViewController *theGrandStaffVC = [[GrandStaffViewController alloc]init];
        [self presentModalViewController:theGrandStaffVC animated:YES];
        
    }
  
    if (interactiveToDisplay == @"CircleOfFifthsViewController") {
        
        CircleOfFifthsViewController *circleOfFifthsVC = [[CircleOfFifthsViewController alloc]init];
        [self presentModalViewController:circleOfFifthsVC animated:YES];
        
    }
    
    if (interactiveToDisplay == @"TrebleClefViewController") {
        
        TrebleClefViewController *trebleClefVC = [[TrebleClefViewController alloc]init];
        [self presentModalViewController:trebleClefVC animated:YES];
        
    }
    
    if (interactiveToDisplay == @"SopranoClefViewController") {
        
        SopranoClefViewController *sopranoClefVC = [[SopranoClefViewController alloc]init];
        [self presentModalViewController:sopranoClefVC animated:YES];
        
    }
  
    if (interactiveToDisplay == @"MezzoSopranoClefViewController") {
        
        MezzoSopranoClefViewController *mezzoSopranoClefVC = [[MezzoSopranoClefViewController alloc]init];
        [self presentModalViewController:mezzoSopranoClefVC animated:YES];
        
    }
    
    
    if (interactiveToDisplay == @"AltoClefViewController") {
        
        AltoClefViewController *altoClefVC = [[AltoClefViewController alloc]init];
        [self presentModalViewController:altoClefVC animated:YES];
        
    }
    
    if (interactiveToDisplay == @"TenorClefViewController") {
    
        TenorClefViewController *tenorClefVC = [[TenorClefViewController alloc]init];
        [self presentModalViewController:tenorClefVC animated:YES];
    
    }

    if (interactiveToDisplay == @"BariToneClefViewController") {
        
        BariToneClefViewController *bariToneClefVC = [[BariToneClefViewController alloc]init];
        [self presentModalViewController:bariToneClefVC animated:YES];
    }

    if (interactiveToDisplay == @"BassClefViewController") {
        
        BassClefViewController *bassClefVC = [[BassClefViewController alloc]init];
        [self presentModalViewController:bassClefVC animated:YES];
    }
   
    if (interactiveToDisplay == @"SubBassClefViewController") {
        
        SubBassClefViewController *subBassClefVC = [[SubBassClefViewController alloc]init];
        [self presentModalViewController:subBassClefVC animated:YES];
    }
    

    
    
 
    if (interactiveToDisplay == @"AeolianViewController") {
        
        AeolianViewController *aeolianVC = [[AeolianViewController alloc]init];
        [self presentModalViewController:aeolianVC animated:YES];

    }
      
  
   //TrebleClefViewController
    
    
    
    
 //   [self presentModalViewController:test animated:YES];
    
    

}

-(IBAction)playMovie:(id)sender{
    
   // NSBundle *bundle = [NSBundle mainBundle];
	
	NSURL *movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:MovieToPlay ofType:@"mp4"]];
    
   moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];
    
    //---play partial screen---
    
    //moviePlayer.view.frame = imageView.bounds;
    //moviePlayer.view.frame = imageView.frame;
    //[imageView addSubview:moviePlayer.view];

    

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayer.moviePlayer];

        
    [self.view addSubview:moviePlayer.view];

    
	//[self presentMoviePlayerViewControllerAnimated:moviePlayer];	
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification {  
    
    NSLog(@"In playback Did Finish");
    
    MPMoviePlayerController *moviePlayer = [notification object];  
    [[NSNotificationCenter defaultCenter] removeObserver:self  
                                                    name:MPMoviePlayerPlaybackDidFinishNotification  
                                                  object:moviePlayer];  
    
    // If the moviePlayer.view was added to the view, it needs to be removed  
    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)]) {  
        [moviePlayer.view removeFromSuperview];  
    }  
    
        
}


- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
       // MovieToPlay = @"GreenBeam";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
  // self.toolBar.alpha = 1.0;

    
    NSLog(@"width = %f",self.view.frame.size.width);
    NSLog(@"height = %f",self.view.frame.size.height);

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {


    // Return YES for supported orientations
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
        return YES;
    }
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        return YES;
    }
    
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait){
        return YES;
    }
    
    if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        return YES;
    } else {return NO;}
    



}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Music Theory 101", @"Music Theory 101");
        
    }
    return self;
}
							
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Examples", @"Examples");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
