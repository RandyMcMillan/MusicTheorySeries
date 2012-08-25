//
//  AppleXylophone.h
//  AudioMeetupDemo
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixerHostAudio.h"

#import "Constants.h"

@interface TrebleClefViewController : UIViewController <UISplitViewControllerDelegate>{
    int                 lastKeyIndex;
    CGRect              keyRects[KEY_COUNT]; 
    
}

@property (nonatomic, assign) MixerHostAudio *mixerHost;

- (int)keyIndexForTouch:(UITouch *)touch;
- (IBAction) mixerOutputGainChanged: (UISlider *) sender;

@end
