//
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
//

#import "WikiViewController.h"
#import "Constants.h"
#import "GradientButton.h"
#import "GradientToolBar.h"

#import "GradientNavBar.h"

#import "iScrollPlugin_JS.h"

@implementation WikiViewController

@synthesize webView;
@synthesize imageURL;
@synthesize isImage;
@synthesize doneButton;
@synthesize uigr;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
   nibBundleOrNil
{
    
        if (IS_IPAD) {
          
            if (self = [super initWithNibName:@"WikiView~ipad" bundle:nibBundleOrNil]) {}
            
        } else {
            
            if (self = [super initWithNibName:@"WikiView~iphone" bundle:nibBundleOrNil]) {}
        
        }

    return self;
}

/*
 *   Implement loadView if you want to create a view hierarchy programmatically
 *   - (void)loadView {
 *   }
 */

/*
 *   If you need to do additional setup after loading the view, override viewDidLoad. */

- (WikiViewController *)initWithScale:(BOOL)enabled
{
    self            = [super init];
    scaleEnabled    = enabled;

    // UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    // self.view.gestureRecognizers = [NSArray arrayWithObjects: tap, nil];
    // for (UIGestureRecognizer *recognizer in self.view.gestureRecognizers) recognizer.delegate = self;

    return self;
}

- (void)viewDidLoad
{
    CGRect textFieldFrame = CGRectMake(kLeftMargin, kTweenMargin,
        self.view.bounds.size.width - (kLeftMargin * 2.0), kTextFieldHeight);

    // addressLabel.frame = textFieldFrame;

#if TARGET_IPHONE_SIMULATOR
        //  [NSClassFromString(@"WebView") _enableRemoteInspector];
        // NSLog(@"MediaBrowserViewController.m Line 76. This makes
        // ChildBrowser debbugging in the desktop browser possible
        // http://localhost:9999/?page=1 or 2 ");
#endif

    
    // [toolBar useTBStyle];
    //[navBar useTBStyle];
    [doneButton useDoneButtonStyle];
    [safariButton useDoneButtonStyle];
    [safariButton useSafariStyle];
    [backButton useDoneButtonStyle];
    [backButton useBackStyle];
    [forwardButton useDoneButtonStyle];
    [forwardButton useForwardStyle];
    [refreshButton useDoneButtonStyle];
    [refreshButton useRefreshStyle];

    webView.delegate        = self;
    webView.scalesPageToFit = TRUE;

    UITapGestureRecognizer  *tap            = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    UITapGestureRecognizer  *twoFingerTap   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
    twoFingerTap.numberOfTouchesRequired = 2;
    UITapGestureRecognizer *dtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    dtap.numberOfTapsRequired = 2;
    // UISwipeGestureRecognizer *swipeAll = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAll:)];
    // swipeAll.direction = (UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight);
    // swipeAll.numberOfTouchesRequired = 1;

    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    swipeLeft.direction = (UISwipeGestureRecognizerDirectionLeft);
    swipeLeft.numberOfTouchesRequired = 1;
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    swipeRight.direction = (UISwipeGestureRecognizerDirectionRight);
    swipeRight.numberOfTouchesRequired = 1;
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];
    swipeUp.direction = (UISwipeGestureRecognizerDirectionUp);
    swipeUp.numberOfTouchesRequired = 1;
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
    swipeDown.direction = (UISwipeGestureRecognizerDirectionDown);
    swipeDown.numberOfTouchesRequired = 1;

    UISwipeGestureRecognizer *twoFingerSwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    twoFingerSwipeLeft.direction = (UISwipeGestureRecognizerDirectionLeft);
    twoFingerSwipeLeft.numberOfTouchesRequired = 1;
    UISwipeGestureRecognizer *twoFingerSwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    twoFingerSwipeRight.direction = (UISwipeGestureRecognizerDirectionRight);
    twoFingerSwipeRight.numberOfTouchesRequired = 1;

    webView.gestureRecognizers = [NSArray arrayWithObjects:tap, twoFingerTap, dtap, /*swipeAll,*/ swipeLeft, swipeRight, swipeUp, swipeDown, nil];
    [swipeRight release];
    [swipeLeft release];
    [swipeUp release];
    [swipeDown release];
    [twoFingerTap release];
    [twoFingerSwipeLeft release];
    [twoFingerSwipeRight release];

    for (UIGestureRecognizer *recognizer in webView.gestureRecognizers) {
        recognizer.delegate = self;
    }
}   /* viewDidLoad */

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Promote the touched view
    // [self.superview bringubviewToFront:self];

    // initialize translation offsets
    // tx = self.transform.tx;
    // ty = self.transform.ty;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];

    if (touch.tapCount == 3) {
        // Reset geometry upon double-tap
        webView.transform = CGAffineTransformIdentity;
        tx = 0.0f; ty = 0.0f; scale = 1.0f; theta = 0.0f;
    }
}

- (void)hideToolBar
{
    CGRect newRectangle = CGRectMake(0,
        0,
        toolBar.frame.size.width,
        VIEWBOUNDS.size.height
        );

    //  [webView setFrame:newRectangle];

    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationCurveEaseInOut
                     animations:^ {
                         toolBar.alpha = 0.0;
                         navBar.alpha = 0.0;
                           [webView setFrame:newRectangle];
 
                         
                     }
                     completion:^(BOOL finished) {
                         toolBar.hidden = YES;
                         navBar.hidden = YES;
                     }];
    
    
    //toolBar.hidden      = YES;
    //navBar.hidden       = toolBar.hidden;
}

- (void)showToolBar
{
    CGRect newRectangle = CGRectMake(0,
        44,
        toolBar.frame.size.width,
        [self view].frame.size.height - 88
        );

    //  [webView setFrame:newRectangle];

    
    [UIView animateWithDuration:0.8
                          delay:0.0
                        options:UIViewAnimationCurveEaseInOut
                     animations:^ {
                         //unhide first so transition is percievable by user
                         toolBar.hidden = NO;
                         navBar.hidden = NO;
                         toolBar.alpha = 1.0;
                         navBar.alpha = 1.0;
                         [webView setFrame:newRectangle];
 
                         
                     }
                     completion:^(BOOL finished) {
                         //toolBar.hidden = NO;
                         //navBar.hidden = NO;
                         //[webView setFrame:newRectangle];
 
                     }];

    
    
    //toolBar.hidden      = NO;
    //navBar.hidden       = toolBar.hidden;
}

- (void)handleTap:(UITapGestureRecognizer *)uigr
{
    if (toolBar.hidden) {
        // [self   performSelector :@selector(showToolBar) withObject:nil
        //       afterDelay      :10.0];
    } else {
        [self   performSelector :@selector(hideToolBar) withObject:nil
                afterDelay      :0.3];
    }

    NSLog(@"Tapped!!");
}

- (void)handleTwoFingerTap:(UITapGestureRecognizer *)uigr
{
    if (toolBar.hidden) {
        [self   performSelector :@selector(showToolBar) withObject:nil
                afterDelay      :0.0];
    } else {
        [self   performSelector :@selector(hideToolBar) withObject:nil
                afterDelay      :0.0];
    }

    NSLog(@"handleTwoFingerTap!!");
}

- (void)handleDoubleTap:(UIGestureRecognizer *)uigr
{
    NSLog(@"================= double tap ============");

    if (toolBar.hidden) {
        [self   performSelector :@selector(showToolBar) withObject:nil
                afterDelay      :0.0];
    } else {
        [self   performSelector :@selector(hideToolBar) withObject:nil
                afterDelay      :0.0];
    }
}

- (void)swipeAll:(UIGestureRecognizer *)uigr {}

- (void)swipeLeft:(UIGestureRecognizer *)uigr
{
    NSLog(@"swipteLeft \n To handle Swiptes in WebView");
    [webView goForward];
   
    
    [self   performSelector :@selector(showToolBar) withObject:nil
            afterDelay      :0.0];

    
}

- (void)swipeRight:(UIGestureRecognizer *)uigr
{
    NSLog(@"swipteRight \n To handle Swiptes in WebView");
    [webView goBack];
    
    [self   performSelector :@selector(showToolBar) withObject:nil
            afterDelay      :0.0];

}

- (void)twoFingerSwipeLeft:(UIGestureRecognizer *)uigr
{
    NSLog(@"twoFingerSwipeLeft \n To handle Swiptes in WebView");
    [webView goForward];
    
    [self   performSelector :@selector(showToolBar) withObject:nil
            afterDelay      :0.0];

}

- (void)twoFingerSwipeRight:(UIGestureRecognizer *)uigr
{
    NSLog(@"twoFingerSwipeRight \n To handle Swiptes in WebView");
    [webView goBack];
    
    [self   performSelector :@selector(showToolBar) withObject:nil
            afterDelay      :0.0];

}

- (void)swipeUp:(UIGestureRecognizer *)uigr
{
    NSLog(@"swipteUp \n To handle Swiptes in WebView");
}

- (void)swipeDown:(UIGestureRecognizer *)uigr
{
    NSLog(@"swipteDown \n To handle Swiptes in WebView");
}

- (BOOL)gestureRecognizer                                   :(UIGestureRecognizer *)gestureRecognizer
        shouldRecognizeSimultaneouslyWithGestureRecognizer  :(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
    // return NO;
}

- (IBAction)onSafariButtonPress:(id)sender
{
    //   if(delegate != NULL)
    // {
    //   [delegate onOpenInSafari];
    // }

    // if(isImage)
    // {
    //  NSURL* pURL = [ [NSURL alloc] initWithString:imageURL ];
    // [ [ UIApplication sharedApplication ] openURL:pURL  ];
    // }
    // else
    // {
    NSURLRequest *request = webView.request;

    [[UIApplication sharedApplication] openURL:request.URL];

    // }
}   /* onSafariButtonPress */

- (void)closeBrowser
{
    if ([self respondsToSelector:@selector(presentingViewController)]) {
        [[self presentingViewController]    dismissViewControllerAnimated   :
            YES                             completion                      :nil];
    } else {
        [[self parentViewController] dismissModalViewControllerAnimated
            :YES];
    }

    [webView release];
}

- (IBAction)onDoneButtonPress:(id)sender
{
    [webView release];

    [self closeBrowser];
}

- (BOOL)webView         :(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
        navigationType  :(UIWebViewNavigationType)navigationType
{
    NSLog(@"shouldStartLoadWithRequest = %@", request);
    return YES;
}

+ (NSString *)resolveImageResource:(NSString *)resource
{
    NSString    *systemVersion  = [[UIDevice currentDevice] systemVersion];
    BOOL        isLessThaniOS4  =
        ([systemVersion compare:@"4.0" options:NSNumericSearch] ==
        NSOrderedAscending);

    if (isLessThaniOS4) {
        return [NSString stringWithFormat:@"%@.png", resource];
    } else {
        if (([[UIScreen mainScreen] respondsToSelector:@selector(scale)]
                == YES) && ([[UIScreen mainScreen] scale] == 2.00)) {
            return [NSString stringWithFormat:@"%@@2x.png", resource];
        }
    }

    return resource;    // if all else fails
}                       /* resolveImageResource */

- (void)webViewDidStartLoad:(UIWebView *)sender
{
    
    //    [self showToolBar];

    addressLabel.title           = @"Loading...";
    backButton.enabled          = webView.canGoBack;
    forwardButton.enabled       = webView.canGoForward;
    refreshButton.highlighted   = FALSE;

    NSLog(@"webViewDidStartLoad");
    spinner.hidden = FALSE;
    [spinner startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)sender
{
    NSURLRequest *request = webView.request;

    NSLog(@"New Address is : %@", request.URL.absoluteString);

    if ([request.URL.absoluteString hasPrefix:@"file:///"]) {
        addressLabel.title = @"Music Theory 101 appears to be offline.";
    } else {
        addressLabel.title = request.URL.absoluteString;
    }

    backButton.enabled          = webView.canGoBack;
    forwardButton.enabled       = webView.canGoForward;
    doneButton.highlighted      = FALSE;
    refreshButton.highlighted   = FALSE;
    safariButton.highlighted    = FALSE;
    backButton.highlighted      = FALSE;
    forwardButton.highlighted   = FALSE;

    [spinner stopAnimating];
    NSLog(@"webViewDidFinLoad");

    if (delegate != NULL) {
        // [delegate onChildLocationChange:request.URL.absoluteString];
    }

    spinner.hidden = TRUE;
    
    //  [self   performSelector :@selector(showToolBar) withObject:nil
    ///        afterDelay      :0.0];

}   /* webViewDidFinishLoad */

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)
   error
{
    
    [self showToolBar];
    // load error, hide the activity indicator in the status bar
    // [UIApplication sharedApplication].networkActivityIndicatorVisible =
    // NO;

    // report the error inside the webview
    //   NSString* errorString = [NSString stringWithFormat:
    //                              @"<html><center><font size=+5
    // color='red'>An error occurred:<br>%@</font></center></html>",
    //                        error.localizedDescription];
    // [self.webView loadHTMLString:errorString baseURL:nil];

    // from RESOURCES,
    // [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL
    // fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"error"
    // ofType:@"html"]isDirectory:NO]]];

    NSString *page = @"error.html"; // (NSString*) [arguments

    // objectAtIndex:0];//recieve page
    // from
    // cordovaRef.exec("iScrollPlugin.init",
    // page);
    NSLog(@"page = %@", page);

    // CDVViewController* cont = (CDVViewController*)[ super viewController
    // ];//create pointer to the app's MainViewController
    NSString *pagePath = [NSString stringWithFormat:@"%@", page];   // format
                                                                    // pagePath
                                                                    // to
                                                                    // be
                                                                    // usable
    NSLog(@"indexPath = %@", pagePath);
    NSString *path =
        [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:
            @"%@", pagePath] ofType:nil];                                                                           // path
                                                                                                                    // becomes
                                                                                                                    // full
                                                                                                                    // URI
                                                                                                                    // to
                                                                                                                    // page
    NSFileHandle *bodyHandle =
        [NSFileHandle fileHandleForReadingAtPath:path];
    NSString *bodyString =
        [[NSString alloc]   initWithData:[bodyHandle readDataToEndOfFile]
                            encoding    :NSUTF8StringEncoding];                                                             // bodyString
                                                                                                                            // contains
                                                                                                                            // page
    NSString    *endBodyTag     = @"</body>";
    NSString    *htmlTextFloat  =
        [bodyString stringByReplacingOccurrencesOfString:@"</body>"
                    withString                          :kISCROLL_JS];
    [bodyString release];
    NSString *htmlText =
        [NSString stringWithFormat:@"%@%@", htmlTextFloat, endBodyTag];                 // concat
                                                                                        // htmlFloat
    // and
    // endBodyTag
    //   self.view.backgroundColor = [UIColor colorWithRed:0.043
    // green:0.125 blue:0.157 alpha:1.000];
    // self.webView.backgroundColor = [UIColor colorWithRed:0.043
    // green:0.125 blue:0.157 alpha:1.000];
    // [self hideGradientBackground:cont.webView];
    [self.webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:
            path]];

    // [htmlText release];

    //   [htmlTextFloat release ];

    refreshButton.enabled   = FALSE;
    safariButton.enabled    = FALSE;
}   /* webView */

// /When UIWebView bounces this disables the subtle gradient
- (void)hideGradientBackground:(UIView *)theView
{
    for (UIView *subview in theView.subviews) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            subview.hidden = YES;
        }

        [self hideGradientBackground:subview];
    }
}

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
        return YES;
    }

    if (toInterfaceOrientation ==
        UIInterfaceOrientationPortraitUpsideDown) {
        return YES;
    } else {return NO; }
}   /* shouldAutorotateToInterfaceOrientation */

- (BOOL)didAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
   currentInterfaceOrientation
{
    NSLog(@"did auto rotate");
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    // Releases the view if it doesn't
                                        // have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc
{
    //    [webView release];
    [super dealloc];
}

- (void)viewDidUnload
{
    // [webView.gestureRecognizers release];
    [webView release];
}

@end
