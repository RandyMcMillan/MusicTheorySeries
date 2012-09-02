//

//  DetailViewController.m
//  MT101
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import "DetailViewController.h"
#import "GradientButton.h"
#import "GradientToolBar.h"

#import "GrandStaffViewController.h"
#import "AppleXylophoneViewController.h"
#import "TrebleClefViewController.h"
#import "SopranoClefViewController.h"
#import "MezzoSopranoClefViewController.h"
#import "AltoClefViewController.h"
#import "TenorClefViewController.h"
#import "BariToneClefViewController.h"
#import "BassClefViewController.h"
#import "SubBassClefViewController.h"

#import "CircleOfFifthsViewController.h"
#import "ChromaticCircleViewController.h"

#import "IonianViewController.h"
#import "DorianViewController.h"
#import "PhrygianViewController.h"
#import "LydianViewController.h"
#import "MixoLydianViewController.h"
#import "AeolianViewController.h"
#import "LocrianViewController.h"

#import "SolfegeNaturalsViewController.h"
#import "SolfegeSharpsViewController.h"
#import "SolfegeFlatsViewController.h"

#import "WebViewController.h"

#import "ColorUIButton.h"
#import "GradientButton.h"
#import "NavBarBackgroundGradientView.h"

@interface DetailViewController (){

  MPMoviePlayerViewController *moviePlayer;

  // AppleXylophoneViewController *test;
  // AeolianViewController *aeolianVC;
  // GrandStaffViewController *theGrandStaffVC;
  // CircleOfFifthsViewController *circleOfFifthsVC;
  // TrebleClefViewController *trebleClefVC;

}
@property (strong,
  nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
- (void)hideGradientBackground:(UIView*)theView;
@end

@implementation DetailViewController


@synthesize blackButton;
@synthesize whiteButton;
@synthesize alertButton;
@synthesize orangeButton;
@synthesize redButton;
@synthesize greenButton;
@synthesize blackActionButton;
@synthesize whiteActionButton;
@synthesize videoButton;
@synthesize navView;

@synthesize testButton;

//@synthesize redButton;
//@synthesize greenButton;
@synthesize blueButton;
@synthesize brownRedButton;
@synthesize cornerRadiusButton;
@synthesize border5Button;
@synthesize crazyButton;
@synthesize tbButton;

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize musicTheory101Label;
@synthesize vLabel;
@synthesize imageView,MovieToPlay,interactiveToDisplay;
@synthesize wikiToDisplay;

#pragma mark - Managing the detail item
#pragma mark - displayInteractives


-(IBAction)clickMe:(UIButton *)sender {
  NSLog(@"clickMe!");   // I just put this in to verify that the
                        // IBAction was firing;
}



-(IBAction)displayInteractive:(id)sender {

  NSLog(@"interactiveToDisplay = %@ ",interactiveToDisplay);

  if (interactiveToDisplay == @"GrandStaffViewController") {

        GrandStaffViewController *theGrandStaffVC =
      [[GrandStaffViewController alloc] init];
        theGrandStaffVC.modalPresentationStyle =
      UIModalPresentationPageSheet;

        //[self.view addSubview:theGrandStaffVC.view];//fot future
        // consoderation

        [self presentModalViewController:theGrandStaffVC animated:YES];

      }


  if (interactiveToDisplay == @"TrebleClefViewController") {

        TrebleClefViewController *trebleClefVC =
      [[TrebleClefViewController alloc] init];
        trebleClefVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:trebleClefVC animated:YES];

      }

  if (interactiveToDisplay == @"SopranoClefViewController") {

        SopranoClefViewController *sopranoClefVC =
      [[SopranoClefViewController alloc] init];
        sopranoClefVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:sopranoClefVC animated:YES];

      }

  if (interactiveToDisplay == @"MezzoSopranoClefViewController") {

        MezzoSopranoClefViewController *mezzoSopranoClefVC =
      [[MezzoSopranoClefViewController alloc] init];
        mezzoSopranoClefVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:mezzoSopranoClefVC animated:
      YES];

      }


  if (interactiveToDisplay == @"AltoClefViewController") {

        AltoClefViewController *altoClefVC =
      [[AltoClefViewController alloc] init];
        altoClefVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:altoClefVC animated:YES];

      }

  if (interactiveToDisplay == @"TenorClefViewController") {

        TenorClefViewController *tenorClefVC =
      [[TenorClefViewController alloc] init];
        tenorClefVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:tenorClefVC animated:YES];

      }

  if (interactiveToDisplay == @"BariToneClefViewController") {

        BariToneClefViewController *bariToneClefVC =
      [[BariToneClefViewController alloc] init];
        bariToneClefVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:bariToneClefVC animated:YES];
      }

  if (interactiveToDisplay == @"BassClefViewController") {

        BassClefViewController *bassClefVC =
      [[BassClefViewController alloc] init];
        bassClefVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:bassClefVC animated:YES];
      }

  if (interactiveToDisplay == @"SubBassClefViewController") {

        SubBassClefViewController *subBassClefVC =
      [[SubBassClefViewController alloc] init];
        subBassClefVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:subBassClefVC animated:YES];
      }



  //circles
  if (interactiveToDisplay == @"CircleOfFifthsViewController") {

        CircleOfFifthsViewController *circleOfFifthsVC =
      [[CircleOfFifthsViewController alloc] init];
        circleOfFifthsVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:circleOfFifthsVC animated:YES];

      }

  if (interactiveToDisplay == @"ChromaticCircleViewController") {

        ChromaticCircleViewController *chromaticCircleVC =
      [[ChromaticCircleViewController alloc] init];
        chromaticCircleVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:chromaticCircleVC animated:YES
        ];

      }


//modes

  if (interactiveToDisplay == @"IonianViewController") {

        IonianViewController *ionianVC =
      [[IonianViewController alloc] init];
        ionianVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:ionianVC animated:YES];

      }

  if (interactiveToDisplay == @"DorianViewController") {

        DorianViewController *dorianVC =
      [[DorianViewController alloc] init];
        dorianVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:dorianVC animated:YES];

      }


  if (interactiveToDisplay == @"PhrygianViewController") {

        PhrygianViewController *phrygianVC =
      [[PhrygianViewController alloc] init];
        phrygianVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:phrygianVC animated:YES];

      }


  if (interactiveToDisplay == @"LydianViewController") {

        LydianViewController *lydianVC =
      [[LydianViewController alloc] init];
        lydianVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:lydianVC animated:YES];

      }


  if (interactiveToDisplay == @"MixoLydianViewController") {

        MixoLydianViewController *mixoLydianVC =
      [[MixoLydianViewController alloc] init];
        mixoLydianVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:mixoLydianVC animated:YES];

      }


  if (interactiveToDisplay == @"AeolianViewController") {

        AeolianViewController *aeolianVC =
      [[AeolianViewController alloc] init];
        aeolianVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:aeolianVC animated:YES];

      }


  if (interactiveToDisplay == @"LocrianViewController") {

        LocrianViewController *locrianVC =
      [[LocrianViewController alloc] init];
        locrianVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:locrianVC animated:YES];

      }


  if (interactiveToDisplay == @"SolfegeNaturalsViewController") {

        SolfegeNaturalsViewController *solfegeNaturalsVC =
      [[SolfegeNaturalsViewController alloc] init];
        solfegeNaturalsVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:solfegeNaturalsVC animated:YES
        ];

      }

  if (interactiveToDisplay == @"SolfegeSharpsViewController") {

        SolfegeSharpsViewController *solfegeSharpsVC =
      [[SolfegeSharpsViewController alloc] init];
        solfegeSharpsVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:solfegeSharpsVC animated:YES];

      }

  if (interactiveToDisplay == @"SolfegeFlatsViewController") {

        SolfegeFlatsViewController *solfegeFlatsVC =
      [[SolfegeFlatsViewController alloc] init];
        solfegeFlatsVC.modalPresentationStyle =
      UIModalPresentationPageSheet;
        [self presentModalViewController:solfegeFlatsVC animated:YES];

      }

  //   [self presentModalViewController:test animated:YES];

} /* displayInteractive */



-(IBAction)playMovie:(id)sender {

  // NSBundle *bundle = [NSBundle mainBundle];

  NSURL *movieURL =
    [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:
      MovieToPlay ofType:@"mp4"]];

  moviePlayer =
    [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];

  //---play partial screen---
  //moviePlayer.view.frame = imageView.bounds;
  //moviePlayer.view.frame = imageView.frame;
  //[imageView addSubview:moviePlayer.view];

  [[NSNotificationCenter defaultCenter] addObserver:self
    selector:@selector(moviePlayBackDidFinish:)
    name:MPMoviePlayerPlaybackDidFinishNotification
    object:moviePlayer.moviePlayer];

  moviePlayer.modalPresentationStyle = UIModalPresentationPageSheet;

  // [self.view addSubview:moviePlayer.view];

  [self presentModalViewController:moviePlayer animated:YES];

  //[self presentMoviePlayerViewControllerAnimated:moviePlayer];
} /* playMovie */



- (void) moviePlayBackDidFinish:(NSNotification*)notification {

  NSLog(@"In playback Did Finish");

  MPMoviePlayerController *moviePlayer = [notification object];
  [[NSNotificationCenter defaultCenter] removeObserver:self
    name:MPMoviePlayerPlaybackDidFinishNotification
    object:moviePlayer];

  // If the moviePlayer.view was added to the view, it needs to be
  // removed
  if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)
    ]) {
        [moviePlayer.view removeFromSuperview];
      }

} /* moviePlayBackDidFinish */



#pragma mark - displayWiki

-(IBAction)displayWiki:(id)sender {

  NSLog(@"displayWiki = %@", wikiToDisplay);

  WebViewController *wikiVC = [[WebViewController alloc] init];
  wikiVC.modalPresentationStyle = UIModalPresentationPageSheet;
  [self presentModalViewController:wikiVC animated:YES];


  //Create a URL object.
  NSURL *url = [NSURL URLWithString:wikiToDisplay];
  NSLog(@"%@",url);

  [wikiVC.webView setBackgroundColor:[UIColor clearColor]];
  [self hideGradientBackground:wikiVC.webView];

  //URL Requst Object
  NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];

  //This is where more webView controls should go for presentation



  /*example


  NSLog(@"Opening Url : %@",url);

  if( [url hasSuffix:@".png" ]  ||
     [url hasSuffix:@".jpg" ]  ||
     [url hasSuffix:@".jpeg" ] ||
     [url hasSuffix:@".bmp" ]  ||
     [url hasSuffix:@".gif" ]  )
  {
      [ imageURL release ];
      imageURL = [url copy];
      isImage = YES;
      NSString* htmlText = @"<html><body style='background-color:#333;margin:0px;padding:0px;'><img style='min-height:200px;margin:0px;padding:0px;width:100%;height:auto;' alt='' src='IMGSRC'/></body></html>";
      htmlText = [ htmlText stringByReplacingOccurrencesOfString:@"IMGSRC" withString:url ];

      [webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];

  }
  else
  {
      imageURL = @"";
      isImage = NO;
      NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
      [webView loadRequest:request];
  }
  webView.hidden = NO;

  */


  //Load the request in the UIWebView.
  [wikiVC.webView loadRequest:requestObj];

  //[webView loadHTMLString:@"This is a completely transparent
  // UIWebView. Notice the missing gradient at the top and bottom as you
  // scroll up and down." baseURL:nil];


} /* displayWiki */



- (void)setDetailItem:(id)newDetailItem {

  if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;

        // Update the view.
        [self configureView];
      }

  if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
      }
} /* setDetailItem */



- (void)configureView {

  // Update the user interface for the detail item.
  if (self.detailItem) {
        // MovieToPlay = @"GreenBeam";
      }


  [blackButton useBlackStyle];
  [whiteButton useWhiteStyle];
  [alertButton useAlertStyle];
  [orangeButton useSimpleOrangeStyle];

  // [redButton useRedDeleteStyle];
  // [greenButton useGreenConfirmStyle];
  [whiteActionButton useWhiteActionSheetStyle];
  [blackActionButton useBlackActionSheetStyle];

  [videoButton useVideoStyle];
  [wikiButton useWikiStyle];
  [interActiveButton useInteractiveStyle];
  [navView useTBStyle];

//    self.redButton.fillColor = [UIColor redColor];
//  self.greenButton.fillColor = [UIColor greenColor];
//    self.blueButton.fillColor = [UIColor blueColor];
//    self.blueButton.tapColor = [UIColor colorWithRed:0 green:0 blue:0
// alpha:1.0];
//   self.brownRedButton.fillColor = [UIColor brownColor];
//    self.brownRedButton.tapColor = [UIColor redColor];
//    self.cornerRadiusButton.radius = 18;
//    self.border5Button.lineWidth = 5;
//    self.crazyButton.radius = 40;
//    self.crazyButton.strokeColor = [UIColor greenColor];
//    self.crazyButton.lineWidth = 10;
//    self.crazyButton.fillColor = [UIColor brownColor];
//    self.crazyButton.tapColor = [UIColor purpleColor];
//    self.crazyButton.tapStrokeColor = [UIColor yellowColor];

//    self.tbButton.radius = 5;
//    self.tbButton.strokeColor = [UIColor colorWithRed:0.494
// green:0.510 blue:0.576 alpha:1.000];//[UIColor clearColor];

  self.imageView.backgroundColor =
    [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.000];
  [self.imageView.layer setCornerRadius:8.0f];
  [self.toolBar.layer setCornerRadius:18.0f];
  [self hideGradientBackground:self.toolBar];

  NSString *appVersion =
    [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)
    kCFBundleVersionKey];
  NSLog(@"appVersion = %@",appVersion);
  self.detailDescriptionLabel.text = appVersion;

} /* configureView */



- (void) hideGradientBackground:(UIView*)theView
{
  for (UIView * subview in theView.subviews)
      {
        if ([subview isKindOfClass:[UIImageView class]])
          subview.hidden = YES;

        [self hideGradientBackground:subview];
      }
}



- (void)viewDidLoad {

  [super viewDidLoad];

  // Do any additional setup after loading the view, typically from a
  // nib.
  [self configureView];

  // self.toolBar.alpha = 1.0;
  NSLog(@"width = %f",self.view.frame.size.width);
  NSLog(@"height = %f",self.view.frame.size.height);

} /* viewDidLoad */



- (void)viewDidUnload {

  [super viewDidUnload];

  // Release any retained subviews of the main view.
  self.detailDescriptionLabel = nil;

  [self setTestButton:nil];
  [self setRedButton:nil];
  [self setGreenButton:nil];
  [self setBlueButton:nil];
  [self setBrownRedButton:nil];
  [self setCornerRadiusButton:nil];
  [self setBorder5Button:nil];
  [self setCrazyButton:nil];


} /* viewDidUnload */



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
 toInterfaceOrientation {


  // Return YES for supported orientations
  if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        return YES;
      }

  if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        return YES;
      }

  if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
      }

  if (toInterfaceOrientation ==
    UIInterfaceOrientationPortraitUpsideDown) {
        return YES;
      } else {return NO;}

} /* shouldAutorotateToInterfaceOrientation */



- (BOOL)didAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
 currentInterfaceOrientation {

  NSLog(@"did auto rotate");
  return YES;

}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
 nibBundleOrNil {

  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
        self.title = NSLocalizedString(@"Music Theory 101",
      @"Music Theory 101");
      }

  return self;
}



#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController
 willHideViewController:(UIViewController *)viewController
 withBarButtonItem:(UIBarButtonItem *)barButtonItem
 forPopoverController:(
  UIPopoverController *)popoverController {
  barButtonItem.title = NSLocalizedString(@"Examples", @"Examples");
  [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
  self.masterPopoverController = popoverController;
}



- (void)splitViewController:(UISplitViewController *)splitController
 willShowViewController:(UIViewController *)viewController
 invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
  // Called when the view is shown again in the split view, invalidating
  // the button and popover controller.
  [self.navigationItem setLeftBarButtonItem:nil animated:YES];
  self.masterPopoverController = nil;
}



@end
