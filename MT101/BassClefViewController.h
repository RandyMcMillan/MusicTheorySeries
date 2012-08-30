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

@interface BassClefViewController : UIViewController <UISplitViewControllerDelegate>{
    int                 lastKeyIndex;
    CGRect              keyRects[KEY_COUNT];

    IBOutlet UIImageView *imageView;
    IBOutlet UIToolbar *toolBar;
    IBOutlet UIBarButtonItem *closeButton;
    UILabel *label0;
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
    UILabel *label5;
    UILabel *label6;
    UILabel *label7;
    UILabel *label8;
    UILabel *label9;
    UILabel *label10;
    UILabel *label11;
    UILabel *label12;
    UILabel *label13;
    UILabel *label14;
    UILabel *label15;
    UILabel *label16;
    UILabel *label17;
    UILabel *label18;
    UILabel *label19;
    UILabel *label20;
    UILabel *label21;
    UILabel *label22;
    UILabel *label23;
    UILabel *label24;
    UILabel *label25;

}

@property (nonatomic, assign) MixerHostAudio *mixerHost;

- (int)keyIndexForTouch:(UITouch *)touch;
- (IBAction) mixerOutputGainChanged: (UISlider *) sender;
- (IBAction) onDoneButtonPress:(id)sender;

@end
