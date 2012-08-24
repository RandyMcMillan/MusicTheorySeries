//
//  WebViewController.m
//  WebViewTutorial
//
//  Created by iPhone SDK Articles on 8/19/08.
//  Copyright 2008 www.iPhoneSDKArticles.com. All rights reserved.
//

#import "WebViewController.h"


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
   
    
#if TARGET_IPHONE_SIMULATOR
    [NSClassFromString(@"WebView") _enableRemoteInspector];
    NSLog(@"MediaBrowserViewController.m Line 76. This makes ChildBrowser debbugging in the desktop browser possible http://localhost:9999/?page=1 or 2 ");
#endif
    
    
    
    refreshBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/but_refresh"]];
    backBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/arrow_left"]];
    fwdBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/arrow_right"]];
    safariBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/compass"]];

    backBtn.enabled = webView.canGoBack;
    fwdBtn.enabled = webView.canGoForward;

    webView.delegate = self;
    
    
    
    
//	NSString *urlAddress = @"http://www.google.com";
	
	//Create a URL object.
//	NSURL *url = [NSURL URLWithString:urlAddress];
	
	//URL Requst Object
//	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//Load the request in the UIWebView.
//	[webView loadRequest:requestObj];
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


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
{
    
    NSLog(@"shouldStartLoadWithRequest");
   // NSURL *requestURL =[ [ request URL ] retain ];
 //   if ( ( [ [ requestURL scheme ] isEqualToString: @"http" ] || [ [ requestURL scheme ] isEqualToString: @"https" ] || [ [ requestURL scheme ] isEqualToString: @"mailto" ] || [ [ requestURL scheme ] isEqualToString: @"tel" ] || [ [ requestURL scheme ] isEqualToString: @"maps" ])
   //     && ( /*navigationType == UIWebViewNavigationTypeLinkClicked ||*/ navigationType == UIWebViewNavigationTypeOther ) ) {
     //   return ![ [ UIApplication sharedApplication ] openURL: [ requestURL autorelease ] ];
   // }
   // [ requestURL release ];
    
    NSString *rURL = [NSString stringWithFormat:@"%@",request.URL];
    
    if ([rURL hasSuffix:@".png"]) {
        NSLog(@" %@ ... has .png",rURL);
        
        NSString* htmlText = @"<html><body style='background-color:#333;margin:0px;padding:0px;'><img style='min-height:200px;margin:0px;padding:0px;width:100%;height:auto;' alt='' src='IMGSRC'/></body></html>";
        htmlText = [ htmlText stringByReplacingOccurrencesOfString:@"IMGSRC" withString:request.URL ];
        
        [self.webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];

        
        
        
    }
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
    [ spinner startAnimating ];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)sender
{
    NSURLRequest *request = webView.request;
    NSLog(@"New Address is : %@",request.URL.absoluteString);
    addressLabel.text = request.URL.absoluteString;
    backBtn.enabled = webView.canGoBack;
    fwdBtn.enabled = webView.canGoForward;
    [ spinner stopAnimating ];
    NSLog(@"webViewDidFinLoad");
 
    if(delegate != NULL)
    {
        //[delegate onChildLocationChange:request.URL.absoluteString];
    }
    
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
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
