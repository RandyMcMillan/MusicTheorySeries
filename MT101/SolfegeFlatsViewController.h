//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixerHostAudio.h"
#import "GradientButton.h"
#import "GradientToolBar.h"
#import "Constants.h"
#import "ExampleView.h"
#import "UIImage+PDF.h"

@interface SolfegeFlatsViewController : UIViewController <
    UISplitViewControllerDelegate>{
    int     lastKeyIndex;
    CGRect  keyRects[KEY_COUNT];

    IBOutlet ExampleView        *imageView;
    IBOutlet GradientToolBar    *toolBar;
    IBOutlet GradientButton     *closeButton;
        
        IBOutlet UILabel *label0;
        IBOutlet UILabel *label1;
        IBOutlet UILabel *label2;
        IBOutlet UILabel *label3;
        IBOutlet UILabel *label4;
        IBOutlet UILabel *label5;
        IBOutlet UILabel *label6;
        IBOutlet UILabel *label7;
        IBOutlet UILabel *label8;
        IBOutlet UILabel *label9;
        IBOutlet UILabel *label10;
        IBOutlet UILabel *label11;
        IBOutlet UILabel *label12;
        IBOutlet UILabel *label13;
        IBOutlet UILabel *label14;
        IBOutlet UILabel *label15;
        IBOutlet UILabel *label16;
        IBOutlet UILabel *label17;
        IBOutlet UILabel *label18;
        IBOutlet UILabel *label19;
        IBOutlet UILabel *label20;
        IBOutlet UILabel *label21;
        IBOutlet UILabel *label22;
        IBOutlet UILabel *label23;
        IBOutlet UILabel *label24;
        IBOutlet UILabel *label25;
        IBOutlet UILabel *label26;
        IBOutlet UILabel *label27;
        IBOutlet UILabel *label28;
        IBOutlet UILabel *label29;
        IBOutlet UILabel *label30;
        IBOutlet UILabel *label31;
        IBOutlet UILabel *label32;
        IBOutlet UILabel *label33;
        IBOutlet UILabel *label34;
        IBOutlet UILabel *label35;
        IBOutlet UILabel *label36;
        IBOutlet UILabel *label37;
        IBOutlet UILabel *label38;
        IBOutlet UILabel *label39;
        IBOutlet UILabel *label40;
        IBOutlet UILabel *label41;
        IBOutlet UILabel *label42;
        IBOutlet UILabel *label43;
        IBOutlet UILabel *label44;
        
        
}

@property (nonatomic, assign) MixerHostAudio *mixerHost;

- (int)keyIndexForTouch:(UITouch *)touch;
- (IBAction)mixerOutputGainChanged:(UISlider *)sender;
- (IBAction)onDoneButtonPress:(id)sender;

@end
