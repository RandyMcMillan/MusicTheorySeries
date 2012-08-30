//
//  WebViewController.m
//  WebViewTutorial
//
//  Created by iPhone SDK Articles on 8/19/08.
//  Copyright 2008 www.iPhoneSDKArticles.com. All rights reserved.
//

#import "WebViewController.h"
#import "Constants.h"
#import "iScrollPlugin_JS.h"


@implementation WebViewController

@synthesize webView;
@synthesize imageURL;
@synthesize isImage;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Initialization code
    }
    return self;
}

/*
 Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
}
 */

/*
 If you need to do additional setup after loading the view, override viewDidLoad. */
- (void)viewDidLoad {


    CGRect textFieldFrame = CGRectMake(kLeftMargin, kTweenMargin,
        self.view.bounds.size.width - (kLeftMargin * 2.0), kTextFieldHeight);

    addressLabel.frame = textFieldFrame;


#if TARGET_IPHONE_SIMULATOR
  //  [NSClassFromString(@"WebView") _enableRemoteInspector];
    //NSLog(@"MediaBrowserViewController.m Line 76. This makes ChildBrowser debbugging in the desktop browser possible http://localhost:9999/?page=1 or 2 ");
#endif



    refreshBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/but_refresh"]];
    backBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/arrow_left"]];
    fwdBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/arrow_right"]];
    safariBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/compass"]];

    refreshBtn.enabled = TRUE;
    safariBtn.enabled = TRUE;
    backBtn.enabled = webView.canGoBack;
    fwdBtn.enabled = webView.canGoForward;

    webView.delegate = self;




//	NSString *urlAddress = @"http://www.google.com";

    //Create a URL object.
//SURL *url = [NSURL URLWithString:urlAddress];

    //URL Requst Object
//NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];

    //Load the request in the UIWebView.
    //[webView loadRequest:requestObj];
}

-(IBAction) onSafariButtonPress:(id)sender
{

 //   if(delegate != NULL)
   // {
     //   [delegate onOpenInSafari];
    //}
    
    //if(isImage)
    //{
      //  NSURL* pURL = [ [NSURL alloc] initWithString:imageURL ];
        //[ [ UIApplication sharedApplication ] openURL:pURL  ];
    //}
    //else
    //{
        NSURLRequest *request = webView.request;
        [[UIApplication sharedApplication] openURL:request.URL];
    //}
    
    
}



-(void)closeBrowser {
    
    if ([self respondsToSelector:@selector(presentingViewController)]) {
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    } else {
        [[self parentViewController] dismissModalViewControllerAnimated:YES];
    }
}

-(IBAction) onDoneButtonPress:(id)sender {

    [ self closeBrowser];
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType; {

    NSLog(@"shouldStartLoadWithRequest");

    return YES;
}


+ (NSString*) resolveImageResource:(NSString*)resource
{
    NSString* systemVersion = [[UIDevice currentDevice] systemVersion];
    BOOL isLessThaniOS4 = ([systemVersion compare:@"4.0" options:NSNumericSearch] == NSOrderedAscending);

    if (isLessThaniOS4) {

        return [NSString stringWithFormat:@"%@.png", resource];

    } else {

        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES && [[UIScreen mainScreen] scale] == 2.00) {

            return [NSString stringWithFormat:@"%@@2x.png", resource];

        }

    }

    return resource;//if all else fails
}


- (void)webViewDidStartLoad:(UIWebView *)sender {
    addressLabel.text = @"Loading...";

    backBtn.enabled = webView.canGoBack;
    fwdBtn.enabled = webView.canGoForward;
    NSLog(@"webViewDidStartLoad");
    spinner.hidden = FALSE;
    [ spinner startAnimating ];

}

- (void)webViewDidFinishLoad:(UIWebView *)sender {

    NSURLRequest *request = webView.request;
    NSLog(@"New Address is : %@",request.URL.absoluteString);
    
    if ([request.URL.absoluteString hasPrefix:@"file:///"]) {
        
        addressLabel.text = @"Music Theory 101 appears to be offline.";
    
    
    } else {
        
       addressLabel.text = request.URL.absoluteString;
    
    }

    backBtn.enabled = webView.canGoBack;
    fwdBtn.enabled = webView.canGoForward;
    [ spinner stopAnimating ];
    NSLog(@"webViewDidFinLoad");
 
    if(delegate != NULL) {
        //[delegate onChildLocationChange:request.URL.absoluteString];
    }

    spinner.hidden = TRUE;


}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {

    // load error, hide the activity indicator in the status bar
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    // report the error inside the webview
 //   NSString* errorString = [NSString stringWithFormat:
   //                              @"<html><center><font size=+5 color='red'>An error occurred:<br>%@</font></center></html>",
     //                        error.localizedDescription];
    //[self.webView loadHTMLString:errorString baseURL:nil];
    
    //from RESOURCES,
    //[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"error" ofType:@"html"]isDirectory:NO]]];
    
    NSString *page = @"error.html";//(NSString*) [arguments objectAtIndex:0];//recieve page from cordovaRef.exec("iScrollPlugin.init", page);
    NSLog(@"page = %@", page);
    //CDVViewController* cont = (CDVViewController*)[ super viewController ];//create pointer to the app's MainViewController
    NSString *pagePath = [NSString stringWithFormat:@"%@", page];//format pagePath to be usable
    NSLog(@"indexPath = %@",pagePath);
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@", pagePath] ofType:nil];//path becomes full URI to page
    NSFileHandle *bodyHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSString *bodyString = [[NSString alloc] initWithData: [bodyHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding];//bodyString contains page
    NSString* endBodyTag = @"</body>";
    NSString* htmlTextFloat = [ bodyString stringByReplacingOccurrencesOfString:@"</body>" withString:kISCROLL_JS];
    NSString* htmlText = [NSString stringWithFormat:@"%@%@", htmlTextFloat,endBodyTag];//concat htmlFloat and endBodyTag
 //   self.view.backgroundColor = [UIColor colorWithRed:0.043 green:0.125 blue:0.157 alpha:1.000];
   // self.webView.backgroundColor = [UIColor colorWithRed:0.043 green:0.125 blue:0.157 alpha:1.000];
    //[self hideGradientBackground:cont.webView];
    [self.webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:path]];

    refreshBtn.enabled = FALSE;
    safariBtn.enabled = FALSE;
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {


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

    if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        return YES;
    } else {return NO;}

}

- (BOOL)didAutorotateToInterfaceOrientation:(UIInterfaceOrientation)currentInterfaceOrientation {

    NSLog(@"did auto rotate");
    return YES;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [webView release];
    [super dealloc];
}


@end
