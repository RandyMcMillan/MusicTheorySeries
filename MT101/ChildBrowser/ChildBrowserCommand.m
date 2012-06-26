//  Created by Jesse MacFadyen on 10-05-29.
//  Copyright 2010 Nitobi. All rights reserved.
//  Copyright 2012, Randy McMillan

#import "ChildBrowserCommand.h"

//#import "Cordova/CDVViewController.h"
#import "cleaverViewController.h"


#define IS_IPAD        (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@implementation ChildBrowserCommand

@synthesize childBrowser;



- (void) showWebPage:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options // args: url
{
    if(childBrowser == NULL)
    {
	childBrowser = [[ ChildBrowserViewController alloc ] initWithScale:FALSE ];
	childBrowser.delegate = self;
    }

    /* // TODO: Work in progress
     NSString* strOrientations = [ options objectForKey:@"supportedOrientations"];
     NSArray* supportedOrientations = [strOrientations componentsSeparatedByString:@","];
     */

    //CDVViewController* cont = (CDVViewController*)[ super viewController ];
    
    CDVViewController* cont = (CDVViewController*)[ super viewController ];
    
    childBrowser.view.autoresizingMask = ( UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    childBrowser.view.autoresizesSubviews = YES;
    //childBrowser.modalPresentationStyle = cont.modalPresentationStyle;
    childBrowser.supportedOrientations = cont.supportedOrientations;
    
    
    
    if (IS_IPAD) {
        
        if (childBrowser.modalPresentationStyle == UIModalPresentationFullScreen) {
            //doesnt like modal fullscreen
            childBrowser.modalPresentationStyle = UIModalPresentationPageSheet;       
        }
    }
    else 
    {
        NSLog(@"iphone doesnt like modal presentations in landscape");
        NSLog(@"iphone doesnt like modal presentations in landscape");        
        NSLog(@"iphone doesnt like modal presentations in landscape");        
        NSLog(@"iphone doesnt like modal presentations in landscape");        
        NSLog(@"iphone doesnt like modal presentations in landscape");        

    }
    
    

    NSString *url = (NSString*) [arguments objectAtIndex:0];

    [childBrowser loadURL:url  ];
    
    [ cont presentModalViewController:childBrowser animated:YES ];

}
- (void) getPage:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    NSString *url = (NSString*) [arguments objectAtIndex:0];
    [childBrowser loadURL:url  ];
}

-(void) close:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options // args: url
{
    [ childBrowser closeBrowser];

}

-(void) onClose
{
    NSString* jsCallback = [NSString stringWithFormat:@"window.plugins.childBrowser.onClose();",@""];
    [self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
}

-(void) onOpenInSafari
{
    NSString* jsCallback = [NSString stringWithFormat:@"window.plugins.childBrowser.onOpenExternal();",@""];
    [self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
}


-(void) onChildLocationChange:(NSString*)newLoc
{

    NSString* tempLoc = [NSString stringWithFormat:@"%@",newLoc];
    NSString* encUrl = [tempLoc stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSString* jsCallback = [NSString stringWithFormat:@"window.plugins.childBrowser.onLocationChange('%@');",encUrl];
    [self.webView stringByEvaluatingJavaScriptFromString:jsCallback];

}
@end
