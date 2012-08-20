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
    
    
    refreshBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/but_refresh"]];
    backBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/arrow_left"]];
    fwdBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/arrow_right"]];
    safariBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"WebView.bundle/compass"]];

	
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
    NSURL *requestURL =[ [ request URL ] retain ];
    if ( ( [ [ requestURL scheme ] isEqualToString: @"http" ] || [ [ requestURL scheme ] isEqualToString: @"https" ] || [ [ requestURL scheme ] isEqualToString: @"mailto" ] || [ [ requestURL scheme ] isEqualToString: @"tel" ] || [ [ requestURL scheme ] isEqualToString: @"maps" ])
        && ( /*navigationType == UIWebViewNavigationTypeLinkClicked ||*/ navigationType == UIWebViewNavigationTypeOther ) ) {
        return ![ [ UIApplication sharedApplication ] openURL: [ requestURL autorelease ] ];
    }
    [ requestURL release ];
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
