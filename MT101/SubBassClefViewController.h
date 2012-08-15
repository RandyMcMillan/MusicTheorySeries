//
//  SubBassClefViewController.h
//  MT101
//
//  Created by Randy McMillan on 8/15/12.
//
//

#import <UIKit/UIKit.h>
#import "MixerHostAudio.h"

#define KEY_COUNT 6

@interface SubBassClefViewController : UIViewController <UISplitViewControllerDelegate>{
    int                 lastKeyIndex;
    CGRect              keyRects[KEY_COUNT];
    
}

@property (nonatomic, assign) MixerHostAudio *mixerHost;

- (int)keyIndexForTouch:(UITouch *)touch;
- (IBAction) mixerOutputGainChanged: (UISlider *) sender;

@end
