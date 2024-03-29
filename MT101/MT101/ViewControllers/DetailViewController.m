//
//  DetailViewController.m
//  MT101
//
//

#import "DetailViewController.h"
#import "AppleXylophoneViewController.h"

@interface DetailViewController () {
    MPMoviePlayerViewController     *moviePlayer;
    AppleXylophoneViewController    *test;
}
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem              = _detailItem;
@synthesize detailDescriptionLabel  = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;

@synthesize imageView, MovieToPlay;

#pragma mark - Managing the detail item

- (IBAction)displayInteractive:(id)sender
{
    NSLog(@"displayInteractive");

    AppleXylophoneViewController *test = [[AppleXylophoneViewController alloc] init];
    // [self.view addSubview:test.view];
    // test.modalTransitionStyle = UIViewAnimationOptionTransitionFlipFromLeft;
    // test.modalPresentationStyle = UIViewAnimationOptionTransitionFlipFromLeft;
    // self.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentModalViewController:test animated:YES];
}

- (IBAction)playMovie:(id)sender
{
    // NSBundle *bundle = [NSBundle mainBundle];

    NSURL *movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:MovieToPlay ofType:@"mp4"]];

    moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];

    // ---play partial screen---

    moviePlayer.view.frame  = imageView.bounds;
    moviePlayer.view.frame  = imageView.frame;
    // [imageView addSubview:moviePlayer.view];

    [[NSNotificationCenter defaultCenter]   addObserver :self
                                            selector    :@selector(moviePlayBackDidFinish:)
                                            name        :MPMoviePlayerPlaybackDidFinishNotification
                                            object      :moviePlayer.moviePlayer];

    [self.view addSubview:moviePlayer.view];

    // [self presentMoviePlayerViewControllerAnimated:moviePlayer];
}

- (void)moviePlayBackDidFinish:(NSNotification *)notification
{
    NSLog(@"In playback Did Finish");

    MPMoviePlayerController *moviePlayer = [notification object];
    [[NSNotificationCenter defaultCenter]   removeObserver  :self
                                            name            :MPMoviePlayerPlaybackDidFinishNotification
                                            object          :moviePlayer];

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
    self.toolBar.alpha = 1.0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
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

    if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        return NO;
    } else {return NO; }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        // self.title = NSLocalizedString(@"Video Player", @"Video Player");
    }

    return self;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Videos", @"Videos");
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
