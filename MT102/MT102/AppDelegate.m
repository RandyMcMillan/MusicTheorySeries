//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
//MT102
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "DetailViewController.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@implementation AppDelegate

@synthesize window = _window;
@synthesize splitViewController = _splitViewController;

- (BOOL)application                     :(UIApplication *)application
        didFinishLaunchingWithOptions   :(NSDictionary *)launchOptions
{
    self.window =
        [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [application setStatusBarHidden:YES];

    // Override point for customization after application launch.

    MasterViewController *masterViewController =
        [[MasterViewController alloc]   initWithNibName :
        @"MasterViewController"
                                        bundle          :nil];
    UINavigationController *masterNavigationController =
        [[UINavigationController alloc] initWithRootViewController:
        masterViewController];

    
    if (IS_IPAD) {
        
    
    DetailViewController *detailViewController =
        [[DetailViewController alloc]   initWithNibName :
        @"DetailViewController~ipad"
                                        bundle          :nil];
        
        UINavigationController *detailNavigationController =
        [[UINavigationController alloc] initWithRootViewController:
         detailViewController];
        
        masterViewController.detailViewController = detailViewController;
        masterViewController.detailViewController = detailViewController;
        
        self.splitViewController                    = [[UISplitViewController alloc] init];
        self.splitViewController.delegate           = detailViewController;
        self.splitViewController.viewControllers    = @[masterNavigationController, detailNavigationController];
        self.window.rootViewController              = self.splitViewController;

 
    }else{
       
        DetailViewController *detailViewController =
        [[DetailViewController alloc]   initWithNibName :
         @"DetailViewController~iphone"
                                        bundle          :nil];
        
        //  UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:kdetailViewController];
        
        masterViewController.detailViewController = detailViewController;
        masterViewController.detailViewController = detailViewController;
        self.window.rootViewController = masterNavigationController;

        
        
    }


    
    [self.window makeKeyAndVisible];

    return YES;
} /* application */

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive
    // state. This can occur for certain types of temporary interruptions
    // (such as an incoming phone call or SMS message) or when the user
    // quits the application and it begins the transition to the
    // background state.
    // Use this method to pause ongoing tasks, disable timers, and
    // throttle down OpenGL ES frame rates. Games should use this method
    // to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data,
    // invalidate timers, and store enough application state information
    // to restore your application to its current state in case it is
    // terminated later.
    // If your application supports background execution, this method is
    // called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the
    // inactive state; here you can undo many of the changes made on
    // entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the
    // application was inactive. If the application was previously in the
    // background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if
    // appropriate. See also applicationDidEnterBackground:.

    [self.splitViewController release];
}

@end
