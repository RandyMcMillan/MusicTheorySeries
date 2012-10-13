//
//  MT101v5.1AppDelegate.h
//  MT101v5.1
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright Instinctive Code 2010.
//

#import <UIKit/UIKit.h>

@class RootViewController;
@class DetailViewController;
@class MT101v5.1Controller;

@interface MT101v5.1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MT101v5.1Controller *splitViewController;
    RootViewController *rootViewController;
    DetailViewController *detailViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MT101v5.1Controller *splitViewController;
@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@end
