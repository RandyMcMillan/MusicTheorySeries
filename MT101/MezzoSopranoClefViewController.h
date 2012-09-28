//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixerHostAudio.h"
#import "GradientButton.h"
#import "GradientToolBar.h"
#import "Constants.h"
#import "UIImage+PDF.h"
#import "ExampleView.h"
@interface MezzoSopranoClefViewController : UIViewController <
    UISplitViewControllerDelegate>{
    int     lastKeyIndex;
    CGRect  keyRects[KEY_COUNT];

    IBOutlet ExampleView        *imageView;
    IBOutlet GradientToolBar    *toolBar;
    IBOutlet GradientButton     *closeButton;
  
    
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
        UILabel *label26;
        UILabel *label27;
        UILabel *label28;
        UILabel *label29;
        UILabel *label30;
        UILabel *label31;
        UILabel *label32;
        UILabel *label33;
        UILabel *label34;
        UILabel *label35;
        UILabel *label36;
        UILabel *label37;
        UILabel *label38;
        UILabel *label39;
        UILabel *label40;
        UILabel *label41;
        UILabel *label42;
        UILabel *label43;
        UILabel *label44;
        

    
    }

@property (nonatomic, assign) MixerHostAudio *mixerHost;

- (int)keyIndexForTouch:(UITouch *)touch;
- (IBAction)mixerOutputGainChanged:(UISlider *)sender;
- (IBAction)onDoneButtonPress:(id)sender;

@end
