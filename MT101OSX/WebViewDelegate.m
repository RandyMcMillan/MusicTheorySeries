//
//  WebViewDelegaate.m
//  MacGap
//
//  Created by Randy McMillan on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WebViewDelegate.h"
#import "Sound.h"

@implementation WebViewDelegate

@synthesize sound;

- (void) webView:(WebView*)webView windowScriptObjectAvailable:(WebScriptObject*)windowScriptObject
{
	if (self.sound == nil) { self.sound = [Sound new]; }
	[windowScriptObject setValue:self.sound forKey:@"sound"];
}

/* This logs all errors from Javascript, nifty */
- (void) webView:(WebView*)webView addMessageToConsole:(NSDictionary*)message
{
	if (![message isKindOfClass:[NSDictionary class]]) { 
		return;
	}
	
	NSLog(@"JavaScript error: %@:%@: %@", 
		  [[message objectForKey:@"sourceURL"] lastPathComponent],	// could be nil
		  [message objectForKey:@"lineNumber"],
		  [message objectForKey:@"message"]);
}

#pragma mark WebScripting protocol

/* checks whether a selector is acceptable to be called from JavaScript */
+ (BOOL) isSelectorExcludedFromWebScript:(SEL)selector
{
	return YES;
}

// right now exclude all properties (eg keys)
+ (BOOL) isKeyExcludedFromWebScript:(const char*)name
{
	return YES;
}


@end
