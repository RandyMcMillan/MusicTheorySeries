//
//  ContentView.h
//  MacGap
//
//  Created by Randy McMillan on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@class WebViewDelegate;

@interface ContentView : NSView {

    IBOutlet WebView* webView;
	WebViewDelegate* delegate;
}

@property (retain) WebView* webView;
@property (retain) WebViewDelegate* delegate;


@end


