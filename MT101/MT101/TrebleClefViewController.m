//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
#import "TrebleClefViewController.h"
#import "GradientButton.h"
#import "GradientToolBar.h"
#import "Constants.h"
#import "GrandStaffMacros.h"

@implementation TrebleClefViewController

@synthesize mixerHost;

- (void)dealloc
{
    [super dealloc];
    [mixerHost release];
}

- (void)closeBrowser
{
    if ([self respondsToSelector:@selector(presentingViewController)]) {
        [[self presentingViewController]    dismissViewControllerAnimated   :
            YES                             completion                      :nil];
    } else {
        [[self parentViewController] dismissViewControllerAnimated:YES completion:nil];
    }

    [mixerHost stopAUGraph];

    self.mixerHost = nil;
} /* closeBrowser */

- (IBAction)onDoneButtonPress:(id)sender
{
    [self closeBrowser];
}

- (void)drawRects
{
    // define the note rectangles
    keyRects[0] = label0.frame; // C2;

    keyRects[1]     = label1.frame;
    keyRects[2]     = label2.frame;
    keyRects[3]     = label3.frame;
    keyRects[4]     = label4.frame;
    keyRects[5]     = label5.frame;
    keyRects[6]     = label6.frame;
    keyRects[7]     = label7.frame;
    keyRects[8]     = label8.frame;     // G2sharp;
    keyRects[9]     = label9.frame;
    keyRects[10]    = label10.frame;    // A2sharp;
    keyRects[11]    = label11.frame;

    keyRects[12] = label12.frame;

    keyRects[13]    = label13.frame;    // C3sharp;
    keyRects[14]    = label14.frame;
    keyRects[15]    = label15.frame;    // D3sharp;
    keyRects[16]    = label16.frame;
    keyRects[17]    = label17.frame;
    keyRects[18]    = label18.frame;    // F3sharp;
    keyRects[19]    = label19.frame;
    keyRects[20]    = label20.frame;    // G3sharp;
    keyRects[21]    = label21.frame;
    keyRects[22]    = label22.frame;    // A3sharp;
    keyRects[23]    = label23.frame;

    keyRects[24] = label24.frame;

    keyRects[25]    = label25.frame;    // C4sharp;
    keyRects[26]    = label26.frame;
    keyRects[27]    = label27.frame;    // D4sharp;
    keyRects[28]    = label28.frame;
    keyRects[29]    = label29.frame;
    keyRects[30]    = label30.frame;    // F4sharp;
    keyRects[31]    = label31.frame;
    keyRects[32]    = label32.frame;    // G4sharp;
    keyRects[33]    = label33.frame;
    keyRects[34]    = label34.frame;    // A4sharp;
    keyRects[35]    = label35.frame;

    keyRects[36] = label36.frame;

    keyRects[37]    = label37.frame;    // C5sharp;
    keyRects[38]    = label38.frame;
    keyRects[39]    = label39.frame;    // D5sharp;
    keyRects[40]    = label40.frame;
    keyRects[41]    = label41.frame;
    keyRects[42]    = label42.frame; // F5sharp;
    keyRects[43]    = label43.frame;
    // keyRects[44]    = CGRectZero;//label44.frame;

     #if TARGET_IPHONE_SIMULATOR
    // displayed in Simulator

    label0.backgroundColor  = DO;
    label0.text             = [NSString stringWithFormat:@"0"];

    label1.backgroundColor  = DI;
    label1.text             = [NSString stringWithFormat:@"1"];

    label2.backgroundColor  = RE;
    label2.text             = [NSString stringWithFormat:@"2"];

    label3.backgroundColor  = RI;
    label3.text             = [NSString stringWithFormat:@"3"];

    label4.backgroundColor  = MI;
    label4.text             = [NSString stringWithFormat:@"4"];

    label5.backgroundColor  = FA;
    label5.text             = [NSString stringWithFormat:@"5"];

    label6.backgroundColor  = FI;
    label6.text             = [NSString stringWithFormat:@"6"];

    label7.backgroundColor  = SOL;
    label7.text             = [NSString stringWithFormat:@"7"];

    label8.backgroundColor  = SI;
    label8.text             = [NSString stringWithFormat:@"8"];

    label9.backgroundColor  = LA;
    label9.text             = [NSString stringWithFormat:@"9"];

    label10.backgroundColor = LI;
    label10.text            = [NSString stringWithFormat:@"10"];

    label11.backgroundColor = TI;
    label11.text            = [NSString stringWithFormat:@"11"];

    label12.backgroundColor = DO;
    label12.text            = [NSString stringWithFormat:@"•"];

    label13.backgroundColor = DI;
    label13.text            = [NSString stringWithFormat:@"13"];

    label14.backgroundColor = RE;
    label14.text            = [NSString stringWithFormat:@"14"];

    label15.backgroundColor = RI;
    label15.text            = [NSString stringWithFormat:@"15"];

    label16.backgroundColor = MI;
    label16.text            = [NSString stringWithFormat:@"16"];

    label17.backgroundColor = FA;
    label17.text            = [NSString stringWithFormat:@"17"];

    label18.backgroundColor = FI;
    label18.text            = [NSString stringWithFormat:@"18"];

    label19.backgroundColor = SOL;
    label19.text            = [NSString stringWithFormat:@"19"];

    label20.backgroundColor = SI;
    label20.text            = [NSString stringWithFormat:@"20"];

    label21.backgroundColor = LA;
    label21.text            = [NSString stringWithFormat:@"21"];

    label22.backgroundColor = LI;
    label22.text            = [NSString stringWithFormat:@"22"];

    label23.backgroundColor = TI;
    label23.text            = [NSString stringWithFormat:@"23"];

    label24.backgroundColor = DO;
    label24.text            = [NSString stringWithFormat:@"24"];

    label25.backgroundColor = DI;
    label25.text            = [NSString stringWithFormat:@"25"];

    label26.backgroundColor = RE;
    label26.text            = [NSString stringWithFormat:@"26"];

    label27.backgroundColor = RI;
    label27.text            = [NSString stringWithFormat:@"27"];

    label28.backgroundColor = MI;
    label28.text            = [NSString stringWithFormat:@"28"];

    label29.backgroundColor = FA;
    label29.text            = [NSString stringWithFormat:@"29"];

    label30.backgroundColor = FI;
    label30.text            = [NSString stringWithFormat:@"30"];

    label31.backgroundColor = SOL;
    label31.text            = [NSString stringWithFormat:@"31"];

    label32.backgroundColor = SI;
    label32.text            = [NSString stringWithFormat:@"32"];

    label33.backgroundColor = LA;
    label33.text            = [NSString stringWithFormat:@"33"];

    label34.backgroundColor = LI;
    label34.text            = [NSString stringWithFormat:@"34"];

    label35.backgroundColor = TI;
    label35.text            = [NSString stringWithFormat:@"35"];

    label36.backgroundColor = DO;
    label36.text            = [NSString stringWithFormat:@"36"];

    label37.backgroundColor = DI;
    label37.text            = [NSString stringWithFormat:@"37"];

    label38.backgroundColor = RE;
    label38.text            = [NSString stringWithFormat:@"38"];

    label39.backgroundColor = RI;
    label39.text            = [NSString stringWithFormat:@"39"];

    label40.backgroundColor = MI;
    label40.text            = [NSString stringWithFormat:@"40"];

    label41.backgroundColor = FA;
    label41.text            = [NSString stringWithFormat:@"41"];

    label42.backgroundColor = FI;
    label42.text            = [NSString stringWithFormat:@"42"];

    label43.backgroundColor = SOL;
    label43.text            = [NSString stringWithFormat:@"43"];

    label44.backgroundColor = SI;
    label44.text            = [NSString stringWithFormat:@"44"];

    [self.view addSubview:label0];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    [self.view addSubview:label5];
    [self.view addSubview:label6];
    [self.view addSubview:label7];
    [self.view addSubview:label8];
    [self.view addSubview:label9];
    [self.view addSubview:label10];
    [self.view addSubview:label11];
    [self.view addSubview:label12];

    [self.view addSubview:label13];

    [self.view addSubview:label14];
    [self.view addSubview:label15];
    [self.view addSubview:label16];
    [self.view addSubview:label17];
    [self.view addSubview:label18];
    [self.view addSubview:label19];
    [self.view addSubview:label20];
    [self.view addSubview:label21];
    [self.view addSubview:label22];
    [self.view addSubview:label23];
    [self.view addSubview:label24];
    [self.view addSubview:label25];
    [self.view addSubview:label26];
    [self.view addSubview:label27];
    [self.view addSubview:label28];
    [self.view addSubview:label29];
    [self.view addSubview:label30];
    [self.view addSubview:label31];
    [self.view addSubview:label32];
    [self.view addSubview:label33];
    [self.view addSubview:label34];
    [self.view addSubview:label35];
    [self.view addSubview:label36];
    [self.view addSubview:label37];
    [self.view addSubview:label38];
    [self.view addSubview:label39];
    [self.view addSubview:label40];
    [self.view addSubview:label41];
    [self.view addSubview:label42];
    [self.view addSubview:label43];
    [self.view addSubview:label44];
     #endif /* if TARGET_IPHONE_SIMULATOR */
} /* drawRects */

- (void)destroyRects
{
    for (UIView *subview in [self.view subviews]) {
        if (subview == label0) {
            [subview removeFromSuperview];
        }

        if (subview == label1) {
            [subview removeFromSuperview];
        }

        if (subview == label2) {
            [subview removeFromSuperview];
        }

        if (subview == label3) {
            [subview removeFromSuperview];
        }

        if (subview == label4) {
            [subview removeFromSuperview];
        }

        if (subview == label5) {
            [subview removeFromSuperview];
        }

        if (subview == label6) {
            [subview removeFromSuperview];
        }

        if (subview == label7) {
            [subview removeFromSuperview];
        }

        if (subview == label8) {
            [subview removeFromSuperview];
        }

        if (subview == label9) {
            [subview removeFromSuperview];
        }

        if (subview == label10) {
            [subview removeFromSuperview];
        }

        if (subview == label11) {
            [subview removeFromSuperview];
        }

        if (subview == label12) {
            [subview removeFromSuperview];
        }

        if (subview == label13) {
            [subview removeFromSuperview];
        }

        if (subview == label14) {
            [subview removeFromSuperview];
        }

        if (subview == label15) {
            [subview removeFromSuperview];
        }

        if (subview == label16) {
            [subview removeFromSuperview];
        }

        if (subview == label17) {
            [subview removeFromSuperview];
        }

        if (subview == label18) {
            [subview removeFromSuperview];
        }

        if (subview == label19) {
            [subview removeFromSuperview];
        }

        if (subview == label20) {
            [subview removeFromSuperview];
        }

        if (subview == label21) {
            [subview removeFromSuperview];
        }

        if (subview == label22) {
            [subview removeFromSuperview];
        }

        if (subview == label23) {
            [subview removeFromSuperview];
        }

        if (subview == label24) {
            [subview removeFromSuperview];
        }

        if (subview == label25) {
            [subview removeFromSuperview];
        }

        if (subview == label25) {
            [subview removeFromSuperview];
        }

        if (subview == label26) {
            [subview removeFromSuperview];
        }

        if (subview == label27) {
            [subview removeFromSuperview];
        }

        if (subview == label28) {
            [subview removeFromSuperview];
        }

        if (subview == label29) {
            [subview removeFromSuperview];
        }

        if (subview == label30) {
            [subview removeFromSuperview];
        }

        if (subview == label31) {
            [subview removeFromSuperview];
        }

        if (subview == label32) {
            [subview removeFromSuperview];
        }

        if (subview == label33) {
            [subview removeFromSuperview];
        }

        if (subview == label34) {
            [subview removeFromSuperview];
        }

        if (subview == label35) {
            [subview removeFromSuperview];
        }

        if (subview == label36) {
            [subview removeFromSuperview];
        }

        if (subview == label37) {
            [subview removeFromSuperview];
        }

        if (subview == label38) {
            [subview removeFromSuperview];
        }

        if (subview == label39) {
            [subview removeFromSuperview];
        }

        if (subview == label40) {
            [subview removeFromSuperview];
        }

        if (subview == label41) {
            [subview removeFromSuperview];
        }

        if (subview == label42) {
            [subview removeFromSuperview];
        }

        if (subview == label43) {
            [subview removeFromSuperview];
        }

        if (subview == label44) {
            [subview removeFromSuperview];
        }
    }
} /* destroyRects */

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [closeButton useDoneButtonStyle];
    [mixerHost stopAUGraph];

    UIImageView *exampleImageView = [[UIImageView alloc] initWithImage:[UIImage originalSizeImageWithPDFNamed:@"TrebleClef.pdf"]];
    imageView.image = exampleImageView.image;
    [exampleImageView release];

    [imageView useGrandStaffStyle];

    [[UIDevice currentDevice]
        beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]   addObserver :self selector:
        @selector(orientationChanged:)
                                            name        :UIDeviceOrientationDidChangeNotification object:nil];

    // create the mixer
    self.mixerHost = [[MixerHostAudio alloc] init];
    [self.mixerHost setMixerOutputGain:(AudioUnitParameterValue)0.1];

    // start the audio graph
    [mixerHost startAUGraph];
} /* viewDidLoad */

- (void)orientationChanged:(NSNotification *)notification
{
    // We must add a delay here, otherwise we'll swap in the new view
    // too quickly and we'll get an animation glitch
    // [self performSelector:@selector(updateLandscapeView) withObject:nil
    // afterDelay:0];

    NSLog(@"orientationChanged");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [mixerHost stopAUGraph];
    [mixerHost release];
    self.mixerHost = nil;

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

// Handle a change in the mixer output gain slider.
- (IBAction)mixerOutputGainChanged:(UISlider *)sender
{
    [mixerHost setMixerOutputGain:(AudioUnitParameterValue)sender.value
    ];
}

#pragma mark -
#pragma mark Touch events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self destroyRects];
    [self drawRects];

    UITouch *aTouch = [touches anyObject];
    int     idx     = [self keyIndexForTouch:aTouch];

    if (idx >= 0) {
        if ([mixerHost playNote:idx] == YES) {
            lastKeyIndex = idx;
        }
    }
} /* touchesBegan */

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    lastKeyIndex = -1;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *aTouch = [touches anyObject];
    int     idx     = [self keyIndexForTouch:aTouch];

    if ((idx >= 0) && (idx != lastKeyIndex)) {
        if ([mixerHost playNote:idx] == YES) {
            lastKeyIndex = idx;
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    lastKeyIndex = -1;
}

- (int)keyIndexForTouch:(UITouch *)touch
{
    int     keyIndex    = -1;
    CGPoint pt          = [touch locationInView:self.view];

    for (int i = 0; i < KEY_COUNT; i++) {
        CGRect rect = keyRects[i];

        if (CGRectContainsPoint(rect, pt)) {
            keyIndex = i;
            break;
        }
    }

    return keyIndex;
} /* keyIndexForTouch */

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
   toInterfaceOrientation
{
    // Return YES for supported orientations
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        return YES;
    }

    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        return YES;
    }

    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    }

    if (toInterfaceOrientation ==
        UIInterfaceOrientationPortraitUpsideDown) {
        return YES;
    } else {return NO; }
} /* shouldAutorotateToInterfaceOrientation */

- (BOOL)didAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
   currentInterfaceOrientation
{
    NSLog(@"did auto rotate");
    return YES;
}

@end
