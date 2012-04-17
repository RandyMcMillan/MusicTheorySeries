//  Created by Jesse MacFadyen on 10-05-29.
//  Rewritten as MediaBrowser 2012 - @RandyMcMillan
//  Copyright 2012 Randy McMillan All rights reserved.
//

#import <Cordova/CDVFile.h>
#import "MediaBrowserViewController.h"
#import "MediaBrowserConstants.h"
#import "iScrollLib.h"
#import "yourJSLib.h"

//Create js libs in MediaBrowserConstants.h that get inserted in your body

@implementation MediaBrowserViewController

@synthesize imageURL;
@synthesize youTubeUrl;
@synthesize supportedOrientations;
@synthesize isImage;
@synthesize allowsInlineMediaPlayback;
@synthesize delegate;


+ (NSString*) resolveImageResource:(NSString*)resource
{
	NSString* systemVersion = [[UIDevice currentDevice] systemVersion];
	BOOL isLessThaniOS4 = ([systemVersion compare:@"4.0" options:NSNumericSearch] == NSOrderedAscending);
	BOOL isGreaterThaniOS4 = ([systemVersion compare:@"4.0" options:NSNumericSearch] == NSOrderedDescending);
	BOOL isLessThaniOS5 = ([systemVersion compare:@"5.0" options:NSNumericSearch] == NSOrderedAscending);
	BOOL isGreaterThaniOS5 = ([systemVersion compare:@"5.0" options:NSNumericSearch] == NSOrderedDescending);
	// the iPad image (nor retina) differentiation code was not in 3.x, and we have to explicitly set the path
	if (isLessThaniOS4 && isLessThaniOS5)
	{
		NSLog(@"Resource =  %@",resource);
		return [NSString stringWithFormat:@"%@.png", resource];
	}
	
	if ( isGreaterThaniOS4 && isLessThaniOS5)
	{
		NSLog(@"Resource =  %@",resource);
		return [NSString stringWithFormat:@"%@2x.png", resource];
	}
	
	if (isGreaterThaniOS5)
	{
		///Setting up for -72@2x.png resolution
		//return [NSString stringWithFormat:@"%@2x.png", resource];
		//return [NSString stringWithFormat:@"%-72@2x.png", resource];
	}
	//NSLog(@"Resource =  %@",resource);
	return resource;
}


- (MediaBrowserViewController*)initWithScale:(BOOL)enabled
{
	self = [super init];
	scaleEnabled = enabled;
	return self;
}


- (void)viewDidStartLoad
{

/*
	Uncommentto make MediaBrowser debbugging in the desktop browser possible
	Add to your app AddDelegate.m approx line LINE: 173
	debug your app in simulator 
	http://localhost:9999/?page=1
	and
	debug MediaBrowser webView in simulator
	http://localhost:9999/?page=2
*/
/**/
#if TARGET_IPHONE_SIMULATOR
	[NSClassFromString(@"WebView") _enableRemoteInspector];
	NSLog(@"MediaBrowserViewController.m Line 76. This makes MediaBrowser debbugging in the desktop browser possible http://localhost:9999/?page=1 or 2 ");
#endif
/**/

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	[super viewDidLoad];
	[self hideGradientBackground:webView];

	refreshBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"MediaBrowser.bundle/but_refresh"]]; //Todo resource-72@2x.png
	backBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"MediaBrowser.bundle/arrow_left"]];
	fwdBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"MediaBrowser.bundle/arrow_right"]];
	safariBtn.image = [UIImage imageNamed:[[self class] resolveImageResource:@"MediaBrowser.bundle/compass"]];
	webView.delegate = self;
	webView.scalesPageToFit = TRUE;
	NSLog(@"View did load");
}

///When UIWebView bounces this disables the subtle gradient
- (void) hideGradientBackground:(UIView*)theView
{
	for (UIView * subview in theView.subviews)
	{
		if ([subview isKindOfClass:[UIImageView class]])
		subview.hidden = YES;

		[self hideGradientBackground:subview];
	}
}

- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.

	if ([self respondsToSelector:@selector(presentingViewController)]) 
    {
		//Reference UIViewController.h Line:179 for update to iOS 5 difference - @RandyMcMillan
		//[[super presentingViewController] didReceiveMemoryWarning];
		[super didReceiveMemoryWarning];

	}
	else
	{
		webView = nil;
		[super didReceiveMemoryWarning];
	}

	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	NSLog(@"View did UN-load");
}



-(void)closeBrowser
{

	if(delegate != NULL)
	{
		[delegate onClose];
	}

	if ([self respondsToSelector:@selector(presentingViewController)]) 
	{
		//Reference UIViewController.h Line:179 for update to iOS 5 difference - @RandyMcMillan
		[[super presentingViewController] dismissViewControllerAnimated:YES completion:nil];
	}
	else
	{
		[[super parentViewController] dismissModalViewControllerAnimated:YES];
	}
}

-(IBAction) onDoneButtonPress:(id)sender
{

	//addressLabel.text = [NSString stringWithFormat:@"Viewing file %@", url];
	//NSLog(addressLabel.text);
	refreshBtn.enabled = NO;
	safariBtn.enabled = NO;

		//getting your local.whatever.html
		NSString *body = [[NSBundle mainBundle] pathForResource:kVANILLA_HOME_PAGE ofType:nil];
		NSFileHandle *bodyHandle = [NSFileHandle fileHandleForReadingAtPath:body];
		NSString *bodyString = [[NSString alloc] initWithData: [bodyHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
		NSString* bodyText = @"BODYSTRING";

		NSString* htmlTextFloat = @"";
		htmlTextFloat = [ bodyText stringByReplacingOccurrencesOfString:@"BODYSTRING" withString:bodyString ];
		NSString* htmlTextFloat2 = @"<script type='text/javascript'>emptyFunction(){}</script>";
		NSString* htmlTextFloat3 = kYOURJS_LIB;
		NSLog(@"The lib gets injected into your html at this point.");
		NSString* htmlText = [NSString stringWithFormat:@"%@%@%@", htmlTextFloat,htmlTextFloat2,htmlTextFloat3];
		NSLog(@"The lib got injected into your html at this point.");
		imageURL = nil;
		//imageURL = [kVANILLA_HOME_PAGE copy];
		//imageURL = @"about:blank";
		//isImage = YES;
		NSLog(@"Path to %@ = %@",kVANILLA_HOME_PAGE,body);
		//[webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];
		[webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:body]];



///hmm fix this


		[webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:body]];
		[ self closeBrowser];
		//NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]];
		//[webView loadRequest:request];
}

-(IBAction) onSafariButtonPress:(id)sender
{
	if(delegate != NULL)
	{
		[delegate onOpenInSafari];
	}

	if(isImage)
	{
		NSURL* pURL = [ [NSURL alloc] initWithString:imageURL ];
		[ [ UIApplication sharedApplication ] openURL:pURL  ];
	}
	else
	{

		//TODO: open in Safari if possible
		NSURLRequest *request = webView.request;
		[[UIApplication sharedApplication] openURL:request.URL];
	}

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation
{
	BOOL autoRotate = [self.supportedOrientations count] > 1; // autorotate if only more than 1 orientation supported
	if (autoRotate)
	{
		if ([self.supportedOrientations containsObject:[NSNumber numberWithInt:interfaceOrientation]])
		{
			return YES;
		}
	}

	return NO;
}






-(void)transFormYouTubeString:(NSString*)url
{
	NSLog(@"%@",url);
}





- (void)loadURL:(NSString*)url
{
	[ spinner startAnimating ];
	NSURLCache* cache = [NSURLCache sharedURLCache];
	[cache setMemoryCapacity:4 * 1024 * 1024]; //refer NSURLCache.h line:130 for alt values
	[cache setDiskCapacity:512*1024];
	NSLog(@"Opening Url : %@",url);

	if(!allowsInlineMediaPlayback)
	{
		NSLog(@"!allowsInlineMediaPlayback");
		self.allowsInlineMediaPlayback = YES;

	//allowsInlineMediaPlayback = YES;
	}

	if(allowsInlineMediaPlayback)
	{
		NSLog(@"allowsInlineMediaPlayback");
		//self.allowsInlineMediaPlayback = YES;
	}
/*

	Since local and external requests may both end in html
	I use local.whatever.html to make the distinction 

*/

	if([url hasPrefix:kYOUTUBE_URL])
	{
		//[self transFormYouTubeString];
	}

	
	if([url hasPrefix:@"local"])
	{

		addressLabel.text = [NSString stringWithFormat:@"Viewing file %@", url];
		//NSLog(addressLabel.text);
		refreshBtn.enabled = NO;
		safariBtn.enabled = NO;

		if ([url hasSuffix:@"html" ])
		{
		//getting your local.whatever.html
			NSString *body = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@", url] ofType:nil];
			NSFileHandle *bodyHandle = [NSFileHandle fileHandleForReadingAtPath:body];
			NSString *bodyString = [[NSString alloc] initWithData: [bodyHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
			NSString* bodyText = @"BODYSTRING";

			NSString* htmlTextFloat = @"";
			htmlTextFloat = [ bodyText stringByReplacingOccurrencesOfString:@"BODYSTRING" withString:bodyString ];
			NSString* htmlTextFloat2 = @"<script type='text/javascript'>emptyFunction(){}</script>";
			NSString* htmlTextFloat3 = kYOURJS_LIB;
			NSLog(@"The lib gets injected into your html at this point.");
			NSString* htmlText = [NSString stringWithFormat:@"%@%@%@", htmlTextFloat,htmlTextFloat2,htmlTextFloat3];
			NSLog(@"The lib got injected into your html at this point.");
			imageURL = nil;
			imageURL = [url copy];
			//imageURL = @"about:blank";
			isImage = YES;
			NSLog(@"Path to %@ = %@",url,body);
			//[webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];
            [webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:body]];
		}//end if html

		if ([url hasSuffix:@"iscroll"])
		{
		//getting your local.whatever.iscroll
			NSString *body = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@", url] ofType:nil];
			NSFileHandle *bodyHandle = [NSFileHandle fileHandleForReadingAtPath:body];
			NSString *bodyString = [[NSString alloc] initWithData: [bodyHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
			NSString* bodyText = @"BODYSTRING";

			NSString* htmlTextFloat = @"";
			htmlTextFloat = [ bodyText stringByReplacingOccurrencesOfString:@"BODYSTRING" withString:bodyString ];
			NSString* htmlTextFloat2 = @"<script type='text/javascript'>emptyFunction(){/*boo!*/}</script>";
			NSString* htmlTextFloat3 = kISCROLL_LIB;
			NSLog(@"The iScroll lib gets injected into your html at this point.");
			NSString* htmlText = [NSString stringWithFormat:@"%@%@%@", htmlTextFloat,htmlTextFloat2,htmlTextFloat3];
			NSLog(@"The iScroll lib got injected into your html at this point.");
			imageURL = nil;
			imageURL = [url copy];
            //imageURL = @"about:blank";
			isImage = YES;
			NSLog(@"Path to %@ = %@",url,body);
			//[webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];
            [webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:body]];
        }//end if iscroll

		if ([url hasSuffix:@"blah" ] || [url hasSuffix:@"blahblah"])
		{
            //getting your local.whatever.blah or blahblah
			NSString *body = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@", url] ofType:nil];
			NSFileHandle *bodyHandle = [NSFileHandle fileHandleForReadingAtPath:body];
			NSString *bodyString = [[NSString alloc] initWithData: [bodyHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
			NSString* bodyText = @"BODYSTRING";

			NSString* htmlTextFloat = @"";
			htmlTextFloat = [ bodyText stringByReplacingOccurrencesOfString:@"BODYSTRING" withString:bodyString ];
			NSString* htmlTextFloat2 = @"<script type='text/javascript'>emptyFunction(){/*boo!*/}</script>";
			NSString* htmlTextFloat3 = kISCROLL_LIB;
			NSLog(@"The iScroll lib gets injected into your html at this point.");
			NSString* htmlText = [NSString stringWithFormat:@"%@%@%@", htmlTextFloat,htmlTextFloat2,htmlTextFloat3];
			NSLog(@"The iScroll lib got injected into your html at this point.");
			imageURL = nil;
			imageURL = [url copy];
            //imageURL = @"about:blank";
			isImage = YES;
			NSLog(@"Path to %@ = %@",url,body);
			[webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];
        }//end if blah or blahblah




	}//end hasPrefix:@"local"

	else //handle with external selectors

	{

		if([url hasSuffix:@".jpg" ]||[url hasSuffix:@".jpeg"]||[url hasSuffix:@".bmp" ]||[url hasSuffix:@".gif" ])
		{
			imageURL = nil;
			imageURL = [url copy];
			isImage = YES;
			NSString* htmlText = @"<html><body style='background-color:transparent;-webkit-box-align:stretch;border-radius:28px;transition: all 0.525s ease-in-out;padding:0%;'><center><img style='-webkit-box-align:center;padding:0%;max-width:80%;' alt='' src='SRC'/></center></body></html>";
            //NSString* htmlText = @"<html><body style='background-color:transparent;-webkit-box-align:stretch;border-radius:28px;transition: all 0.525s ease-in-out;padding:0%;'><center><img style='-webkit-box-align:center;padding:0%;max-width:80%;' alt='' src='SRC'/></center></body></html>";
			
			htmlText = [ htmlText stringByReplacingOccurrencesOfString:@"SRC" withString:url ];
            [webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];
            
        }//handle .png seperate
		else
			if( [url hasSuffix:@".png" ] )//to handle transparencies
			{
                imageURL = nil;
                imageURL = [url copy];
                isImage = YES;
                NSString* htmlText = @"<html><body style='background-color:white;-webkit-box-align:stretch;border-radius:28px;transition: all 0.525s ease-in-out;padding:0%;'><center><img style='-webkit-box-align:center;padding:0%;max-width:80%;' alt='' src='SRC'/></center></body></html>";
                //NSString* htmlText = @"<html><body style='background-color:transparent;-webkit-box-align:stretch;border-radius:28px;transition: all 0.525s ease-in-out;padding:0%;'><center><img style='-webkit-box-align:center;padding:0%;max-width:80%;' alt='' src='SRC'/></center></body></html>";
                
                htmlText = [ htmlText stringByReplacingOccurrencesOfString:@"SRC" withString:url ];
                [webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];
                
            }//handle .svg seperate
			else
				if( [url hasSuffix:@".svg" ] )//to handle transparencies
				{
                    imageURL = nil;
                    imageURL = [url copy];
                    isImage = YES;
                    NSString* htmlText = @"<html><body style='background-color:transparent;-webkit-box-align:stretch;border-radius:28px;transition: all 0.525s ease-in-out;padding:0%;'><center><img style='-webkit-box-align:center;padding:0%;max-width:80%;' alt='' src='SRC'/></center></body></html>";
                    //NSString* htmlText = @"<html><body style='background-color:transparent;-webkit-box-align:stretch;border-radius:28px;transition: all 0.525s ease-in-out;padding:0%;'><center><img style='-webkit-box-align:center;padding:0%;max-width:80%;' alt='' src='SRC'/></center></body></html>";
                    
                    htmlText = [ htmlText stringByReplacingOccurrencesOfString:@"SRC" withString:url ];
                    [webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];
                    
                }//TODO handle .mp4 seperate
				else
					if( [url hasSuffix:@".mp4_" ] )
					{
                        imageURL = nil;
                        imageURL = [url copy];
                        isImage = YES;
                        NSString* htmlText = @"<html><body><center><video width='320' height='240' controls='controls' allowfullscreen><source src='SRC' type='video/mp4'/></video></center></body></html>";
                        //NSString* htmlText = @"<html><body style='background-color:transparent;-webkit-box-align:stretch;border-radius:28px;transition: all 0.525s ease-in-out;padding:0%;'><center><img style='-webkit-box-align:center;padding:0%;max-width:80%;' alt='' src='SRC'/></center></body></html>";
                        
                        htmlText = [ htmlText stringByReplacingOccurrencesOfString:@"SRC" withString:url ];
                        [webView loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];
                        
                    }


//Any other external URLs
					else
					{
						refreshBtn.enabled = YES;
						safariBtn.enabled = YES;//ensuring the buttons are enabled 

						imageURL = @"";
						isImage = NO;
						NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] 
							cachePolicy:NSURLRequestReturnCacheDataElseLoad 
							timeoutInterval:10.0];
						[webView loadRequest:request];
					}
					}//end else handle with external selectors

	webView.backgroundColor = [UIColor clearColor];
	webView.hidden = NO;
}

- (void)webViewDidStartLoad:(UIWebView *)sender 
{
	addressLabel.text = @"Loading...";
	NSURLRequest *request = webView.request;
	addressLabel.text = request.URL.absoluteString;
	backBtn.enabled = webView.canGoBack;
	fwdBtn.enabled = webView.canGoForward;
	addressLabel.alpha = 0.5;
	[ spinner startAnimating ];

}

- (void)webViewDidFinishLoad:(UIWebView *)sender 
{
	NSURLRequest *request = webView.request;
	addressLabel.text = request.URL.absoluteString;
	backBtn.enabled = webView.canGoBack;
	fwdBtn.enabled = webView.canGoForward;
	[ spinner stopAnimating ];
	addressLabel.alpha = 0.1;//change to 0.0 for complete hide
	if(delegate != NULL)
	{
		[delegate onMediaLocationChange:request.URL.absoluteString];
	}
}

/*
 - (void)webView:(UIWebView *)wv didFailLoadWithError:(NSError *)error 
 {
 NSLog (@"webView:didFailLoadWithError");
 [spinner stopAnimating];
 addressLabel.text = @"Failed";
 if (error != NULL) 
 {
 UIAlertView *errorAlert = [[UIAlertView alloc]
 initWithTitle: [error localizedDescription]
 message: [error localizedFailureReason]
 delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil];
 [errorAlert show];
 [errorAlert release];
 }
 }
 */



- (void)dealloc {
	webView.delegate = nil;
	webView = nil;
	//[webView release];
	closeBtn = nil;
	//[closeBtn release];
	refreshBtn = nil;
	//[refreshBtn release];
	addressLabel = nil;
	//[addressLabel release];
	backBtn = nil;
	//[backBtn release];
	fwdBtn = nil;
	//[fwdBtn release];
	safariBtn = nil;
	//[safariBtn release];
	spinner = nil;
	//[spinner release];
	supportedOrientations = nil;
	//[ supportedOrientations release];
	[super dealloc];
}


@end
