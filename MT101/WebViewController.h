//
//  WebViewController.h
//  WebViewTutorial
//
//  Created by iPhone SDK Articles on 8/19/08.
//  Copyright 2008 www.iPhoneSDKArticles.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController {
	
	IBOutlet UIWebView *webView;
    IBOutlet UIBarButtonItem *doneButton;
    
//    IBOutlet UIBarButtonItem* closeBtn;
    IBOutlet UIBarButtonItem* refreshBtn;
    IBOutlet UILabel* addressLabel;
    IBOutlet UIBarButtonItem* backBtn;
    IBOutlet UIBarButtonItem* fwdBtn;
    IBOutlet UIBarButtonItem* safariBtn;
    IBOutlet UIActivityIndicatorView* spinner;

    
    
}

@property (nonatomic, retain) UIWebView *webView;
- (IBAction) onDoneButtonPress:(id)sender;
- (IBAction)onSafariButtonPress:(id)sender;
- (IBAction)onSafariButtonPress:(id)sender;


@end
