//
//  MacGapAppDelegate.h
//  MacGap
//
//  Created by Randy McMillan on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ContentView.h"

#if (MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_5)
@interface phonegap_macAppDelegate : NSObject  {
#else
@interface MacGapAppDelegate : NSObject <NSApplicationDelegate> {
#endif
    
    IBOutlet NSWindow* window;
    IBOutlet ContentView* contentView;
}

@property (assign) IBOutlet NSWindow* window;
@property (nonatomic, retain) ContentView* contentView;


@end
