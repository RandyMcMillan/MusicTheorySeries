//  Created by Jesse MacFadyen on 10-05-29.
//  Rewritten as MediaBrowser 2012 - @RandyMcMillan
//  Copyright 2012 Randy McMillan All rights reserved.
//

#import "MediaBrowserCommand.h"
#import "MediaBrowserConstants.h"
#ifdef CORDOVA_FRAMEWORK
	#import <Cordova/CDVViewController.h>
	#import <Cordova/CDVFile.h>
#else
	#import "CDVViewController.h"
	#import "CDVFile.h"
#endif


@implementation MediaBrowserCommand

@synthesize mediaBrowser;

- (void) showWebPage:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options // args: url
{	
	if(mediaBrowser == NULL)
	{
		mediaBrowser = [[ MediaBrowserViewController alloc ] initWithScale:FALSE ];
		mediaBrowser.delegate = self;
	}
	
/* // TODO: Work in progress
	NSString* strOrientations = [ options objectForKey:@"supportedOrientations"];
	NSArray* supportedOrientations = [strOrientations componentsSeparatedByString:@","];
*/

	CDVViewController* cont = (CDVViewController*)[ super viewController ];
	mediaBrowser.supportedOrientations = cont.supportedOrientations;
	//[ cont presentModalViewController:childBrowser animated:YES ];

if ([self respondsToSelector:@selector(presentViewController)]) { //Reference UIViewController.h Line:179 for update to iOS 5 difference - @RandyMcMillan
	[ cont presentViewController:mediaBrowser animated:YES completion:nil];
}
else
{
	[ cont presentModalViewController:mediaBrowser animated:YES ];
}

	NSString *url = (NSString*) [arguments objectAtIndex:0];

	///provides youtube.videoid shorthand
	if([url hasPrefix:@"youtube"])
	{
		NSString* youTubeUrl = @"";
		NSLog(@"youTubeUrl = %@",youTubeUrl);
		youTubeUrl = [ url stringByReplacingOccurrencesOfString:@"youtube." withString:kYOUTUBE_URL];
		NSLog(@"youTubeUrl = %@",youTubeUrl);

		url = [NSString stringWithFormat:@"%@", youTubeUrl];
		NSLog(@"url = %@",url);
	}
	
	///provides youtube.videoid shorthand
	if([url hasPrefix:@"wiki"])
	{
		NSString* wikiUrl = @"";
		NSLog(@"wikiUrl = %@",wikiUrl);
		wikiUrl = [ url stringByReplacingOccurrencesOfString:@"wiki." withString:kWIKI_URL];
		NSLog(@"wikiUrl = %@",wikiUrl);
		
		url = [NSString stringWithFormat:@"%@", wikiUrl];
		NSLog(@"url = %@",url);
	}

	
	
	[mediaBrowser loadURL:url];

}

-(void) close:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options // args: url
{
	[ mediaBrowser closeBrowser];

}

-(void) onClose
{
	NSString* jsCallback = [NSString stringWithFormat:@"MediaBrowser._onClose();",@""];
	[self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
}

-(void) onOpenInSafari
{
	NSString* jsCallback = [NSString stringWithFormat:@"MediaBrowser._onOpenExternal();",@""];
	[self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
}


-(void) onMediaLocationChange:(NSString*)newLoc
{

	NSString* tempLoc = [NSString stringWithFormat:@"%@",newLoc];
	NSString* encUrl = [tempLoc stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	NSString* jsCallback = [NSString stringWithFormat:@"MediaBrowser._onLocationChange('%@');",encUrl];
	[self.webView stringByEvaluatingJavaScriptFromString:jsCallback];

}

@end
