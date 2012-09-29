//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

#import "DetailViewController.h"
#import "GradientButton.h"
#import "GradientToolBar.h"
#import "ExampleView.h"
#import "Constants.h"

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

#import "WikiViewController.h"

#import "ColorUIButton.h"
#import "GradientButton.h"
#import "NavBarBackgroundGradientView.h"

@interface DetailViewController () {
    MPMoviePlayerViewController *moviePlayer;
}
@property (strong,
    nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
- (void)hideGradientBackground:(UIView *)theView;
@end

@implementation DetailViewController

@synthesize videoButton;
@synthesize wikiButton;
@synthesize interActiveButton;
@synthesize toolBar;
@synthesize emailButton;
@synthesize composeTweetButton;

@synthesize detailItem              = _detailItem;
@synthesize detailDescriptionLabel  = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize musicTheory101Label;
@synthesize vLabel;
@synthesize imageView, MovieToPlay, interactiveToDisplay;
@synthesize wikiToDisplay;

#pragma mark - Managing the detail item
#pragma mark - displayInteractives

- (IBAction)clickMe:(UIButton *)sender
{
    NSLog(@"clickMe!"); // I just put this in to verify that the
                        // IBAction was firing;
}

- (IBAction)displayInteractive:(id)sender
{
    NSLog(@"interactiveToDisplay = %@ ", interactiveToDisplay);

    if (interactiveToDisplay == @"GrandStaffViewController") {
        GrandStaffViewController *theGrandStaffVC =
            [[GrandStaffViewController alloc] init];
        theGrandStaffVC.modalPresentationStyle =
            UIModalPresentationPageSheet;

        [self presentModalViewController:theGrandStaffVC animated:YES];
        // [self.navigationController pushViewController:theGrandStaffVC animated:YES];

        [theGrandStaffVC  release];
    }

    if (interactiveToDisplay == @"TrebleClefViewController") {
        TrebleClefViewController *trebleClefVC =
            [[TrebleClefViewController alloc] init];
        trebleClefVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:trebleClefVC animated:YES];
        [trebleClefVC release];
    }

    if (interactiveToDisplay == @"SopranoClefViewController") {
        SopranoClefViewController *sopranoClefVC =
            [[SopranoClefViewController alloc] init];
        sopranoClefVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:sopranoClefVC animated:YES];
        [sopranoClefVC release];
    }

    if (interactiveToDisplay == @"MezzoSopranoClefViewController") {
        MezzoSopranoClefViewController *mezzoSopranoClefVC =
            [[MezzoSopranoClefViewController alloc] init];
        mezzoSopranoClefVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:mezzoSopranoClefVC animated:
            YES];
        [mezzoSopranoClefVC release];
    }

    if (interactiveToDisplay == @"AltoClefViewController") {
        AltoClefViewController *altoClefVC =
            [[AltoClefViewController alloc] init];
        altoClefVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:altoClefVC animated:YES];
        [altoClefVC release];
    }

    if (interactiveToDisplay == @"TenorClefViewController") {
        TenorClefViewController *tenorClefVC =
            [[TenorClefViewController alloc] init];
        tenorClefVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:tenorClefVC animated:YES];
        [tenorClefVC release];
    }

    if (interactiveToDisplay == @"BariToneClefViewController") {
        BariToneClefViewController *bariToneClefVC =
            [[BariToneClefViewController alloc] init];
        bariToneClefVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:bariToneClefVC animated:YES];
        [bariToneClefVC release];
    }

    if (interactiveToDisplay == @"BassClefViewController") {
        BassClefViewController *bassClefVC =
            [[BassClefViewController alloc] init];
        bassClefVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:bassClefVC animated:YES];
        [bassClefVC release];
    }

    if (interactiveToDisplay == @"SubBassClefViewController") {
        SubBassClefViewController *subBassClefVC =
            [[SubBassClefViewController alloc] init];
        subBassClefVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:subBassClefVC animated:YES];
        [subBassClefVC release];
    }

    // circles
    if (interactiveToDisplay == @"CircleOfFifthsViewController") {
        CircleOfFifthsViewController *circleOfFifthsVC =
            [[CircleOfFifthsViewController alloc] init];
        circleOfFifthsVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:circleOfFifthsVC animated:YES];
        [circleOfFifthsVC release];
    }

    if (interactiveToDisplay == @"ChromaticCircleViewController") {
        ChromaticCircleViewController *chromaticCircleVC =
            [[ChromaticCircleViewController alloc] init];
        chromaticCircleVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:chromaticCircleVC animated:YES
        ];
        [chromaticCircleVC release];
    }

    // modes

    if (interactiveToDisplay == @"IonianViewController") {
        IonianViewController *ionianVC =
            [[IonianViewController alloc] init];
        ionianVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:ionianVC animated:YES];
        [ionianVC release];
    }

    if (interactiveToDisplay == @"DorianViewController") {
        DorianViewController *dorianVC =
            [[DorianViewController alloc] init];
        dorianVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:dorianVC animated:YES];
        [dorianVC release];
    }

    if (interactiveToDisplay == @"PhrygianViewController") {
        PhrygianViewController *phrygianVC =
            [[PhrygianViewController alloc] init];
        phrygianVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:phrygianVC animated:YES];
        [phrygianVC release];
    }

    if (interactiveToDisplay == @"LydianViewController") {
        LydianViewController *lydianVC =
            [[LydianViewController alloc] init];
        lydianVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:lydianVC animated:YES];
        [lydianVC release];
    }

    if (interactiveToDisplay == @"MixoLydianViewController") {
        MixoLydianViewController *mixoLydianVC =
            [[MixoLydianViewController alloc] init];
        mixoLydianVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:mixoLydianVC animated:YES];
        [mixoLydianVC release];
    }

    if (interactiveToDisplay == @"AeolianViewController") {
        AeolianViewController *aeolianVC =
            [[AeolianViewController alloc] init];
        aeolianVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:aeolianVC animated:YES];
        [aeolianVC release];
    }

    if (interactiveToDisplay == @"LocrianViewController") {
        LocrianViewController *locrianVC =
            [[LocrianViewController alloc] init];
        locrianVC.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:locrianVC animated:YES];
        [locrianVC release];
    }

    if (interactiveToDisplay == @"SolfegeNaturalsViewController") {
        SolfegeNaturalsViewController *solfegeNaturalsVC =
            [[SolfegeNaturalsViewController alloc] init];
        solfegeNaturalsVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:solfegeNaturalsVC animated:YES
        ];
        [solfegeNaturalsVC release];
    }

    if (interactiveToDisplay == @"SolfegeSharpsViewController") {
        SolfegeSharpsViewController *solfegeSharpsVC =
            [[SolfegeSharpsViewController alloc] init];
        solfegeSharpsVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:solfegeSharpsVC animated:YES];
        [solfegeSharpsVC release];
    }

    if (interactiveToDisplay == @"SolfegeFlatsViewController") {
        SolfegeFlatsViewController *solfegeFlatsVC =
            [[SolfegeFlatsViewController alloc] init];
        solfegeFlatsVC.modalPresentationStyle =
            UIModalPresentationPageSheet;
        [self presentModalViewController:solfegeFlatsVC animated:YES];
        [solfegeFlatsVC release];
    }

    //   [self presentModalViewController:test animated:YES];
} /* displayInteractive */

- (IBAction)playMovie:(id)sender
{
    // NSBundle *bundle = [NSBundle mainBundle];

    NSURL *movieURL =
        [NSURL fileURLWithPath:[[NSBundle mainBundle]   pathForResource :
            MovieToPlay                                 ofType          :@"mp4"]];

    moviePlayer =
        [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];

    // ---play partial screen---
    // moviePlayer.view.frame = imageView.bounds;
    // moviePlayer.view.frame = imageView.frame;
    // [imageView addSubview:moviePlayer.view];

    [[NSNotificationCenter defaultCenter]   addObserver :self
                                            selector    :@selector(moviePlayBackDidFinish:)
                                            name        :MPMoviePlayerPlaybackDidFinishNotification
                                            object      :moviePlayer.moviePlayer];

    moviePlayer.modalPresentationStyle = UIModalPresentationPageSheet;

    // [self.view addSubview:moviePlayer.view];

    [self presentModalViewController:moviePlayer animated:YES];

    // [self presentMoviePlayerViewControllerAnimated:moviePlayer];
} /* playMovie */

- (void)moviePlayBackDidFinish:(NSNotification *)notification
{
    NSLog(@"In playback Did Finish");

    MPMoviePlayerController *moviePlayer = [notification object];
    [[NSNotificationCenter defaultCenter]   removeObserver  :self
                                            name            :MPMoviePlayerPlaybackDidFinishNotification
                                            object          :moviePlayer];

    // If the moviePlayer.view was added to the view, it needs to be
    // removed
    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)
        ]) {
        [moviePlayer.view removeFromSuperview];
    }
} /* moviePlayBackDidFinish */

#pragma mark - displayWiki

- (IBAction)displayWiki:(id)sender
{
    NSLog(@"displayWiki = %@", wikiToDisplay);

    WikiViewController *wikiVC = [[WikiViewController alloc] init];
    // wikiVC.modalPresentationStyle = UIModalPresentationPageSheet;
    wikiVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentModalViewController:wikiVC animated:YES];

    // Create a URL object.
    NSURL *url = [NSURL URLWithString:wikiToDisplay];
    NSLog(@"%@", url);

    [wikiVC.webView setBackgroundColor:[UIColor clearColor]];
    [self hideGradientBackground:wikiVC.webView];

    // URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];

    // This is where more webView controls should go for presentation

    /*example
     *
     *
     *   NSLog(@"Opening Url : %@",url);
     *
     *   if( [url hasSuffix:@".png" ]  ||
     *   [url hasSuffix:@".jpg" ]  ||
     *   [url hasSuffix:@".jpeg" ] ||
     *   [url hasSuffix:@".bmp" ]  ||
     *   [url hasSuffix:@".gif" ]  )
     *   {
     *    [ imageURL release ];
     *    imageURL = [url copy];
     *    isImage = YES;
     *    NSString* htmlText = @"<html><body style='background-color:#333;margin:0px;padding:0px;'><img style='min-height:200px;margin:0px;padding:0px;width:100%;height:auto;' alt='' src='IMGSRC'/></body></html>";
     *    htmlText = [ htmlText stringByReplacingOccurrencesOfString:@"IMGSRC" withString:url ];
     *
     *    [webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];
     *
     *   }
     *   else
     *   {
     *    imageURL = @"";
     *    isImage = NO;
     *    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
     *    [webView loadRequest:request];
     *   }
     *   webView.hidden = NO;
     *
     */

    // Load the request in the UIWebView.
    [wikiVC.webView loadRequest:requestObj];
    self.wikiButton.highlighted = FALSE;
    // [webView loadHTMLString:@"This is a completely transparent
    // UIWebView. Notice the missing gradient at the top and bottom as you
    // scroll up and down." baseURL:nil];
} /* displayWiki */

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
} /* setDetailItem */

#pragma mark - configureView

- (void)configureView
{
    
    
	UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    scroll.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
	scroll.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.000];
	scroll.delegate = self;
	//image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image.JPG"]];
	scroll.contentSize = [self view].frame.size;
    [imageView useGrandStaffStyle];
	[scroll addSubview:imageView];
    [self.view bringSubviewToFront:toolBar];
	scroll.minimumZoomScale = scroll.frame.size.width / [self view].frame.size.width;
	scroll.maximumZoomScale = 2.0;
	[scroll setZoomScale:scroll.minimumZoomScale];
    
	self.view = scroll;
	[scroll release];

    
    
    for (UIView *subview in self.view.subviews) {
        
        if ([subview isKindOfClass:[UITextView class]]) {
            
            ((UITextView *)subview).font = [UIFont fontWithName:@"Helvetica-Bold" size:1];
        }
        
    }
    
#if TARGET_IPHONE_SIMULATOR
    //  self.musicTheory101Label.backgroundColor = [UIColor redColor];
    //self.detailDescriptionLabel.backgroundColor = [UIColor blueColor];
    //self.vLabel.backgroundColor = [UIColor yellowColor];
#endif

    
    
    if (self.detailItem) {}

    [imageView useWelcomeStyle];

    // self.detailDescriptionLabel.text =
    //  [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];

    if (IS_IPAD) {
        // ipad landscape welcome screen formatting
        self.musicTheory101Label.text = @"MUSIC THEORY 101";
        self.musicTheory101Label.frame
        = CGRectMake([self view].center.x-163,[self view].center.y+30, 326, 53);
        [self.musicTheory101Label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:39.0]];
        self.musicTheory101Label.hidden = FALSE;
        
        self.vLabel.text = @"v";
        self.vLabel.frame 
        = CGRectMake([self view].center.x+82,[self view].center.y+59.6, 20, 20);
        [self.vLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
        self.vLabel.hidden = FALSE;

        self.detailDescriptionLabel.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
        self.detailDescriptionLabel.frame
        = CGRectMake([self view].center.x+84,[self view].center.y+60, 30, 20);
        [self.detailDescriptionLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:11.0]];
        self.detailDescriptionLabel.hidden = FALSE;
        
        self.interActiveButton.hidden   = FALSE;
        [videoButton useDoneButtonStyle];
        [wikiButton useDoneButtonStyle];
        [interActiveButton useDoneButtonStyle];
        [emailButton useDoneButtonStyle];
        [emailButton useEmailStyle];
        [composeTweetButton useDoneButtonStyle];
        [imageView useWelcomeStyle];
        // useDoneButtonIPad
        // useEmailButtonIPad etc...
        // All styles start with "Basic Style" then augment the style with the secondary styling
        // each style calls basic style first then continues with extra styling in its individual methods
    } else {
        // iphone landscape welcome screen formatting
        self.musicTheory101Label.text   = @"MT101";
        self.musicTheory101Label.hidden = FALSE;
        self.musicTheory101Label.frame  = CGRectMake(self.view.frame.size.width / 2.3, 219, 100, 50);
        self.interActiveButton.hidden   = TRUE;
        self.interActiveButton.frame    = CGRectMake(0, 0, 0, 0);
        self.vLabel.frame = CGRectMake(self.view.frame.size.width / 1.65, 254, 7, 7);
        self.detailDescriptionLabel.frame = CGRectMake(self.view.frame.size.width / 1.60, 254, 20, 20);

        [videoButton useDoneButtonStyle];
        [wikiButton useDoneButtonStyle];
        // [interActiveButton useDoneButtonStyle];
        [emailButton useDoneButtonStyle];
        [emailButton useEmailStyle];
        [composeTweetButton useDoneButtonStyle];
        // [imageView useWelcomeStyle];
        // useDoneButtonIPad
        // useEmailButtonIPad etc...
        // All styles start with "Basic Style" then augment the style with the secondary styling
        // each style calls basic style first then continues with extra styling in its individual methods
    } // build for iPhone

} /* configureView */

#pragma mark - Open the mail interface

- (IBAction)openMail:(id)sender
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];

        mailer.mailComposeDelegate = self;

        [mailer setSubject:@"A Message from a Music Theory 101 user."];

        NSArray *toRecipients = [NSArray arrayWithObjects:@"randy.lee.mcmillan@gmail.com", @"", nil];
        [mailer setToRecipients:toRecipients];

        UIImage     *myImage    = imageView.image;
        NSData      *imageData  = UIImagePNGRepresentation(myImage);
        NSString    *imageName  = @"Music Theory 101 for iOS Created by Randy McMillan Copyright (c) 2012 Randy McMillan. All rights reserved.";
        [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:imageName];

        NSString *emailBody = @"Thank you for your interest in Music Theory 101 for iOS \n All questions are welcome.\n All constructive feed back is welcome.\n Images in this app may be used for educational purposes.\n These images may NEVER be reused/redistributed in any commercial way including other mobile applications. \n\nMusic Theory 101 for iOS \nCreated by Randy McMillan \nCopyright (c) 2012 Randy McMillan. All rights reserved.";

        [mailer setMessageBody:emailBody isHTML:NO];

        // only for iPad
        // mailer.modalPresentationStyle = UIModalPresentationPageSheet;

        [self presentModalViewController:mailer animated:YES];

        [mailer release];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]   initWithTitle       :@"Failure"
                                                    message             :@"Your device doesn't support the composer sheet"
                                                    delegate            :nil
                                                    cancelButtonTitle   :@"OK"
                                                    otherButtonTitles   :nil];
        [alert show];
        [alert release];
    }
}

#pragma mark - MFMailComposeController delegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued");
            break;

        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the Drafts folder");
            break;

        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send the next time the user connects to email");
            break;

        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was nog saved or queued, possibly due to an error");
            break;

        default:
            NSLog(@"Mail not sent");
            break;
    }

    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - isTwitterAvailable

- (void)isTwitterAvailable
{
    NSLog(@"is Twitter Avail?");

    TWTweetComposeViewController    *tweetViewController    = [[TWTweetComposeViewController alloc] init];
    BOOL                            twitterSDKAvailable     = tweetViewController != nil;

    // http://brianistech.wordpress.com/2011/10/13/ios-5-twitter-integration/
    if (tweetViewController != nil) {
        NSLog(@"Twitter is Avail! = %i", twitterSDKAvailable);

        // [tweetViewController release];
    }

    [tweetViewController release];
}

#pragma mark - isTwitterSetup

- (void)isTwitterSetup
{
    BOOL canTweet = [TWTweetComposeViewController canSendTweet];

    NSLog(@"Twitter is setup = %i", canTweet);
}

#pragma mark - compseTweet

- (IBAction)composeTweet:(id)sender
{
    NSString    *tweetText      = @"I am learning music theory with Music Theory 101 for iOS! @MT101App #MT101";
    NSString    *urlAttach      = @"http://itunes.apple.com/us/app/music-theory-101/id322256596?mt=8";
    NSString    *imageAttach    = @"icon-72@2x.png";

    if ([TWTweetComposeViewController canSendTweet]) {
        TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:tweetText];

        if (imageAttach) {
            //    [UIImage originalSizeImageWithPDFNamed:[imageNameList1 objectAtIndex:0]],

            [tweetSheet addImage:[UIImage originalSizeImageWithPDFNamed:@"welcome.pdf"]];
        }

        if (urlAttach) {
            [tweetSheet addURL:[NSURL URLWithString:urlAttach]];
        }

        [self presentModalViewController:tweetSheet animated:YES];
        [tweetSheet release];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc]   initWithTitle       :@"Sorry"
                                                        message             :@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                                        delegate            :self
                                                        cancelButtonTitle   :@"OK"
                                                        otherButtonTitles   :nil];
        [alertView show];
        [alertView release];
    }
}

- (void)hideGradientBackground:(UIView *)theView
{
    for (UIView *subview in theView.subviews) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            subview.hidden = YES;
        }

        [self hideGradientBackground:subview];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
} /* viewDidLoad */

- (void)viewDidUnload
{
    [super viewDidUnload];
    [interactiveToDisplay release];

    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
    interactiveToDisplay        = nil;

    /*
     *   [self setTestButton:nil];
     *   [self setRedButton:nil];
     *   [self setGreenButton:nil];
     *   [self setBlueButton:nil];
     *   [self setBrownRedButton:nil];
     *   [self setCornerRadiusButton:nil];
     *   [self setBorder5Button:nil];
     *   [self setCrazyButton:nil];
     *
     */
} /* viewDidUnload */

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
   toInterfaceOrientation
{
    // Return YES for supported orientations
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        return YES;
    }

    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        return YES;
    }

    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        return NO;
    }

    if (toInterfaceOrientation ==
        UIInterfaceOrientationPortraitUpsideDown) {
        return NO;
    } else {return NO; }
} /* shouldAutorotateToInterfaceOrientation */

- (BOOL)didAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
   currentInterfaceOrientation
{
    NSLog(@"did auto rotate");
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
   nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        self.title = NSLocalizedString(@"Music Theory 101",
            @"Music Theory 101");
        [self.navigationController.view addSubview:emailButton];
    }

    return self;
}

#pragma mark - Split view

- (void)splitViewController     :(UISplitViewController *)splitController
        willHideViewController  :(UIViewController *)viewController
        withBarButtonItem       :(UIBarButtonItem *)barButtonItem
        forPopoverController    :(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Examples", @"Examples");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController         :(UISplitViewController *)splitController
        willShowViewController      :(UIViewController *)viewController
        invalidatingBarButtonItem   :(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating
    // the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
