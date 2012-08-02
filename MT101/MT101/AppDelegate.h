//
//  AppDelegate.h
//  MT101
//
//  Created by David McMahon on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppleXylophoneViewController.h"
#import "AeolianViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UISplitViewController *splitViewController;
@property (nonatomic, retain) IBOutlet AppleXylophoneViewController *viewController;
@property (nonatomic, retain) IBOutlet AeolianViewController *aeolianVC;



@end
