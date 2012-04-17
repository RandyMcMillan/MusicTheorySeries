//
//  MacGapAppDelegate.m
//  MacGap
//
//  Created by Randy McMillan on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MacGapAppDelegate.h"

@implementation MacGapAppDelegate

@synthesize window;
@synthesize contentView;

- (void)applicationDidStartLaunching:(NSNotification *)aNotification {}
- (void)windowDidEnterFullScreen:(NSNotification *)aNotification {}
- (void)windowDidEndLiveResize:(NSNotification *)aNotification {}


- (void)applicationWillFinishLaunching:(NSNotification *)aNotification {

    [[NSNotificationCenter defaultCenter] addObserver:self.contentView 
											 selector:@selector(windowResized:) 
												 name:NSWindowDidResizeNotification 
											   object:[self window]];
	
    NSURL* fileUrl = [NSURL fileURLWithPath:[[Utils sharedInstance] pathForResource:kStartPage]];
	[self.contentView.webView setMainFrameURL:[fileUrl description]];
    
    /* useful colors
     NSColor *brown = [NSColor colorWithCalibratedRed:0.184 green:0.180 blue:0.176 alpha:1.000];
     NSColor *red = [NSColor colorWithCalibratedRed:0.918 green:0.000 blue:0.000 alpha:1.000];
     NSColor *orange = [NSColor colorWithCalibratedRed:0.918 green:0.518 blue:0.000 alpha:1.000];
     NSColor *yellow = [NSColor colorWithCalibratedRed:0.918 green:0.914 blue:0.000 alpha:1.000];
     NSColor *green = [NSColor colorWithCalibratedRed:0.000 green:0.918 blue:0.106 alpha:1.000];
     NSColor *skyBlue = [NSColor colorWithCalibratedRed:0.000 green:0.918 blue:0.906 alpha:1.000];
     NSColor *blue = [NSColor colorWithCalibratedRed:0.000 green:0.020 blue:0.918 alpha:1.000];
     NSColor *clearColor = [NSColor clearColor];
     */
    
    if (kStartFolder == @"www/blah/blah") {}
    else{
        
        NSColor *windowBackGroundColor = [NSColor colorWithCalibratedRed:0.918 green:0.918 blue:0.918 alpha:1.000];
        NSColor *webViewBackGroundColor = [NSColor colorWithCalibratedRed:0.082 green:0.133 blue:0.192 alpha:1.000];
        [window setBackgroundColor:windowBackGroundColor];
        [self.contentView.webView setBackgroundColor:webViewBackGroundColor]; //it ignores "WebView" may not respond to 'setBackGroundColor:' @RandyMcMillan
        self.window.backgroundColor = [NSColor colorWithCalibratedRed:0.933 green:0.933 blue:0.933 alpha:1.000];
    }//end else


}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    self.contentView.webView.alphaValue = 1.0;
    self.contentView.alphaValue = 1.0;

    
}

@end
