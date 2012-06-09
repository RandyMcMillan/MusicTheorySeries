/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

//
//
//  Created by Randy McMillan on 5/9/12.
//  Copyright OpenOSX.org 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cleaverViewController.h"


#define CORDOVA_GRAY_COLOR  [UIColor colorWithRed:0.435 green:0.439 blue:0.447 alpha:1.000]
#define BARBUTTON(TITLE, SELECTOR)  [[UIBarButtonItem alloc] initWithTitle : TITLE style : UIBarButtonItemStylePlain target : self action : SELECTOR]
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#pragma mark Split View Detail Controller
@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate>
{
	UIPopoverController *popoverController;
}
@property (nonatomic, retain) UIPopoverController *popoverController;
@end

@implementation DetailViewController
@synthesize popoverController;

+ (id) controller
{
	DetailViewController *controller = [[DetailViewController alloc] init];
	controller.view.backgroundColor = CORDOVA_GRAY_COLOR;
    
	CDVViewController* cleaverViewController = [CDVViewController new];
	controller.view.autoresizesSubviews = YES;
	cleaverViewController.wwwFolderName = @"www/Welcome/";
	cleaverViewController.startPage = @"Welcome.html";
    
    
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button addTarget:self
               action:@selector(closeCleaverView:)
	 forControlEvents:UIControlEventTouchUpInside];
    
	[button setTitle:@"Close"
            forState:UIControlStateNormal];
	int x = [UIScreen mainScreen].bounds.size.width * 0.885;
	int y = [UIScreen mainScreen].bounds.size.height * 0.004;
	button.frame = CGRectMake(x, y, 85.0, 35.0);
    
    
	//[cleaverViewController.view addSubview:button];
    
	cleaverViewController.view.frame = controller.view.bounds;
    
    
	[controller.view addSubview:cleaverViewController.view];
	[controller.view bringSubviewToFront:cleaverViewController.view];
    
    
    
    
	return controller;
}

// Called upon going into portrait mode, hiding the normal table view
- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)aPopoverController
{
	barButtonItem.title = aViewController.title;
	self.navigationItem.leftBarButtonItem = barButtonItem;
    
	self.popoverController = aPopoverController;
}

// Called upon going into landscape mode.
- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
	self.navigationItem.leftBarButtonItem = nil;
	self.popoverController = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
@end



#pragma mark Table-based Root View Browser
@interface ColorViewController : UITableViewController
@end

@implementation ColorViewController

+ (id) controller
{
    
	ColorViewController *controller = [[ColorViewController alloc] init];
	NSLog(@"%f",controller.view.frame.size.width);
	controller.title = @"NativeNav";
	return controller;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	NSLog(@"indexPath = %@",indexPath);
	NSLog(@"indexPath.row = %i",indexPath.row);
    
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"generic"];
    
	if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"generic"];
    
	NSArray *navList;
	navList = [[NSArray alloc] initWithObjects:
	           @"Circle Of Fifths",
	           @"ChildBrowser",
	           @"How to use Cleaver", ///correspondes to @"Cordova" in the array below
	           @"MrImageProc/index",
	           nil];
    
    
    
	cell.textLabel.text = [NSString stringWithFormat:@"%@", [navList objectAtIndex:indexPath.row]];
	cell.accessoryType = IS_IPAD ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;
    
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
	if (IS_IPAD)
	{
        
		NSArray *navList;
		navList = [[NSArray alloc] initWithObjects:
		           @"CircleOfFifths/CircleOfFifths",
		           @"MediaBrowser",
		           @"Cordova",
		           @"MrImageProc/index",
		           nil];
        
        
		UIViewController *controller = (UIViewController *)self.splitViewController.delegate;
        
		CDVViewController* cleaverViewController = [CDVViewController new];
        
        
		controller.view.autoresizesSubviews = YES;
		cleaverViewController.wwwFolderName = @"www";
		cleaverViewController.startPage = [NSString stringWithFormat:@"%@.html", [navList objectAtIndex:indexPath.row]];
        
		NSLog(@"cleaverViewController.startPage = %@",cleaverViewController.startPage);
        
        
		UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[button addTarget:self
                   action:@selector(closeCleaverView:)
		 forControlEvents:UIControlEventTouchUpInside];
        
		[button setTitle:@"Close"
                forState:UIControlStateNormal];
		int x = [UIScreen mainScreen].bounds.size.width * 0.885;
		int y = [UIScreen mainScreen].bounds.size.height * 0.004;
		button.frame = CGRectMake(x, y, 85.0, 35.0);
        
        
        //[cleaverViewController.view addSubview:button];
        
		cleaverViewController.view.frame = controller.view.bounds;
        
        
		[controller.view addSubview:cleaverViewController.view];
		[controller.view bringSubviewToFront:cleaverViewController.view];
        
        
	}
	else
        if (!IS_IPAD)
        {
            NSArray *navList;
            navList = [[NSArray alloc] initWithObjects:
                       @"index",
                       @"ChildBrowser",
                       @"Cordova",
                       @"MrImageProc/index",
                       nil];
            
            
            
            DetailViewController *controller = [DetailViewController controller];
            
            //controller.view.backgroundColor = [UIColor colorWithRed:0.757 green:0.757 blue:0.757 alpha:1.000];//cell.textLabel.textColor;
            
            CDVViewController* cleaverViewController = [CDVViewController new];
            
            controller.view.autoresizesSubviews = YES;
            //cleaverViewController.wwwFolderName = [NSString stringWithFormat:@"www/%@", [navList objectAtIndex:indexPath.row]];
            cleaverViewController.wwwFolderName = @"www";
            //cleaverViewController.startPage = @"index.html";
            cleaverViewController.startPage = [NSString stringWithFormat:@"%@.html", [navList objectAtIndex:indexPath.row]];
            
            NSLog(@"cleaverViewController.startPage = %@",cleaverViewController.startPage);
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [button addTarget:self
                       action:@selector(closeCleaverView:)
             forControlEvents:UIControlEventTouchUpInside];
            
            [button setTitle:@"Close"
                    forState:UIControlStateNormal];
            
            int x = [UIScreen mainScreen].bounds.size.width * 0.775;
            int y = [UIScreen mainScreen].bounds.size.height * 0.010;
            button.frame = CGRectMake(x, y, 70.0, 35.0);
            
            
            
            //[cleaverViewController.view addSubview:button];
            
            [controller.view addSubview:cleaverViewController.view];
            
            [self.navigationController pushViewController:controller animated:YES];
        }
        else
        {}
    
    
	if (IS_IPAD) {}
	else
        if (!IS_IPAD) {}
        else {}
    
    
    
}

- (void) viewDidAppear: (BOOL) animated
{
	//self.tableView.rowHeight = 72.0f;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return YES;
}
@end

#pragma mark -

#pragma mark Application Setup
@interface TestBedAppDelegate : NSObject <UIApplicationDelegate>
{
	UIWindow *window;
}
@end

@implementation TestBedAppDelegate


- (UISplitViewController *) splitviewController
{
    
    
    
	/////work on resizing!!!
    
    
    
    
    
	// Create the navigation-run root view
	ColorViewController *rootVC = [ColorViewController controller];
	UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:rootVC];
	rootNav.navigationBar.tintColor = CORDOVA_GRAY_COLOR;
    
	// Create the navigation-run detail view
	DetailViewController *detailVC = [DetailViewController controller];
	UINavigationController *detailNav = [[UINavigationController alloc] initWithRootViewController:detailVC];
	detailNav.navigationBar.tintColor = CORDOVA_GRAY_COLOR;
    
	// Add both to the split view controller
	UISplitViewController *svc = [[UISplitViewController alloc] init];
	svc.viewControllers = [NSArray arrayWithObjects: rootNav, detailNav, nil];
	svc.delegate = detailVC;
    
	return svc;
}

- (UINavigationController *) navWithColorViewController
{
	ColorViewController *colorViewController = [ColorViewController controller];
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:colorViewController];
	nav.navigationBar.tintColor = CORDOVA_GRAY_COLOR;
	return nav;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[application setStatusBarHidden:YES];
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	//window.backgroundColor = [UIColor colorWithRed:0.757 green:0.757 blue:0.757 alpha:1.000];
	if (IS_IPAD)
	{
        
		window.rootViewController = [self splitviewController];
        
	}
    
	if (!IS_IPAD) {
		window.rootViewController = [self navWithColorViewController];
	}
    
	[window makeKeyAndVisible];
	return YES;
}
@end
int main(int argc, char *argv[]) {
	@autoreleasepool {
		int retVal = UIApplicationMain(argc, argv, nil, @"TestBedAppDelegate");
		return retVal;
	}
}
