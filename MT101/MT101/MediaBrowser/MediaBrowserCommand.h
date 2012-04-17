//
//  PhoneGap ! ChildBrowserCommand
//
//
//  Created by Jesse MacFadyen on 10-05-29.
//  Copyright 2010 Nitobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifdef CORDOVA_FRAMEWORK
	#import <Cordova/CDVPlugin.h>
	#import <Cordova/CDVFile.h>
#else
	#import "CDVPlugin.h"
	#import "CDVFile.h"

#endif
#import "MediaBrowserViewController.h"



@interface MediaBrowserCommand : CDVPlugin <MediaBrowserDelegate>  {

	MediaBrowserViewController* mediaBrowser;
}

@property (nonatomic, retain) MediaBrowserViewController *mediaBrowser;


- (void) showWebPage:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
-(void) onMediaLocationChange:(NSString*)newLoc;

@end
