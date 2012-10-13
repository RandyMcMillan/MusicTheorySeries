//
//  MT101v5.1AppDelegate.m
//  MT101v5.1
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright Instinctive Code 2010.
//

#import "MT101v5.1AppDelegate.h"
#import "RootViewController.h"
#import "DetailViewController.h"
#import "MT101v5.1Controller.h"

@implementation MT101v5.1AppDelegate


@synthesize window, splitViewController, rootViewController, detailViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Add the split view controller's view to the window and display.
    [window addSubview:splitViewController.view];
    [window makeKeyAndVisible];
	
	[rootViewController performSelector:@selector(selectFirstRow) withObject:nil afterDelay:0];
	[detailViewController performSelector:@selector(configureView) withObject:nil afterDelay:0];
	
	if (NO) { // whether to allow dragging the divider to move the split.
		splitViewController.splitWidth = 15.0; // make it wide enough to actually drag!
		splitViewController.allowsDraggingDivider = YES;
	}
	
    return YES;
}


- (void)dealloc
{
    [splitViewController release];
    [window release];
	
    [super dealloc];
}


@end

