//
//  ChildBrowserViewController.h
//
//  Created by Jesse MacFadyen on 21/07/09.
//  Copyright 2009 Nitobi. All rights reserved.
//
#import <Cordova/CDVFile.h>
#import <UIKit/UIKit.h>

@protocol MediaBrowserDelegate<NSObject>



/*
	*	onChildLocationChanging:newLoc
	*
	*	Discussion:
	*	Invoked when a new page has loaded
*/
-(void) onMediaLocationChange:(NSString*)newLoc;
-(void) onOpenInSafari;
-(void) onClose;
@end


@interface MediaBrowserViewController : UIViewController < UIWebViewDelegate > {
	IBOutlet UIWebView* webView;
	IBOutlet UIBarButtonItem* closeBtn;
	IBOutlet UIBarButtonItem* refreshBtn;
	IBOutlet UILabel* addressLabel;
	IBOutlet UIBarButtonItem* backBtn;
	IBOutlet UIBarButtonItem* fwdBtn;
	IBOutlet UIBarButtonItem* safariBtn;
	IBOutlet UIToolbar* toolbar;
	IBOutlet UIActivityIndicatorView* spinner;
	BOOL scaleEnabled;
	BOOL isImage;
	NSString* imageURL;
	NSString* youTubeUrl;
	NSArray* supportedOrientations;
	id <MediaBrowserDelegate> delegate;
}

@property (nonatomic, retain)id <MediaBrowserDelegate> delegate;
@property (nonatomic, retain) 	NSArray* supportedOrientations;
@property(retain) NSString* imageURL;
@property(retain) NSString* youTubeUrl;
@property(assign) BOOL isImage;
@property (nonatomic) BOOL allowsInlineMediaPlayback;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation; 
- (MediaBrowserViewController*)initWithScale:(BOOL)enabled;
- (IBAction)onDoneButtonPress:(id)sender;
- (IBAction)onSafariButtonPress:(id)sender;
- (void)transFormYouTubeString:(NSString*)url;
- (void)loadURL:(NSString*)url;
-(void)closeBrowser;

@end
