//

//  WebViewController.h
//  WebViewTutorial
//
//  Created by iPhone SDK Articles on 8/19/08.
//  Copyright 2008 www.iPhoneSDKArticles.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientButton.h"
#import "NavBarBackgroundGradientView.h"

@protocol WebViewDelegate <NSObject>
@end

@interface WebViewController : UIViewController <UIWebViewDelegate>{

	IBOutlet UIWebView					*webView;
    
    IBOutlet NavBarBackgroundGradientView *navBar;
   	IBOutlet UILabel					*addressLabel;
 
	IBOutlet UIBarButtonItem			*doneBarButtonItem;
	IBOutlet GradientButton				*doneButton;
	
    IBOutlet UIBarButtonItem			*refreshBarButtonItem;
    IBOutlet GradientButton *refreshButton;
    
	IBOutlet UIBarButtonItem			*backBarButtonItem;
    IBOutlet GradientButton *backButton;
    
	IBOutlet UIBarButtonItem			*fwdBarButtonItem;
	IBOutlet GradientButton *forwardButton;
    
    IBOutlet UIBarButtonItem			*safariBarButtonItem;
	IBOutlet GradientButton *safariButton;
    
    IBOutlet UIActivityIndicatorView	*spinner;
	BOOL								isImage;
	NSString							*imageURL;
	id <WebViewDelegate>				delegate;
}

- (IBAction)onDoneButtonPress:(id)sender;
- (IBAction)onSafariButtonPress:(id)sender;

@property (nonatomic, retain) UIWebView				*webView;
@property (retain) NSString							*imageURL;
@property (assign) BOOL								isImage;
@property (nonatomic, retain) id <WebViewDelegate>	delegate;
@property (nonatomic, retain) GradientButton		*doneButton;

@end
