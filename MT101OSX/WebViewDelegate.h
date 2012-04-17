//
//  WebViewDelegaate.h
//  MacGap
//
//  Created by Randy McMillan on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@class Sound;  

@interface WebViewDelegate : NSObject {}

@property (nonatomic,retain) Sound* sound;

@end
