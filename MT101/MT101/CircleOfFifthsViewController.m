//
//  AppleXylophone.m
//  AudioMeetupDemo
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
#import "CircleOfFifthsViewController.h"

@implementation CircleOfFifthsViewController

@synthesize mixerHost;

- (void)dealloc {
     [super dealloc];
     [mixerHost release];
}


-(void)closeBrowser {
    
    if ([self respondsToSelector:@selector(presentingViewController)]) {
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    } else {
        [[self parentViewController] dismissModalViewControllerAnimated:YES];
    }
    [mixerHost stopAUGraph];
 
    self.mixerHost = nil;

}

-(IBAction) onDoneButtonPress:(id)sender {
    
    [ self closeBrowser];
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [mixerHost stopAUGraph];
    
    //define the "key" xylophone note rectangles
    
    keyRects[0] = CGRectMake([self view].bounds.size.width * 0.457 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.08,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.09// 1/6th width of screen
                             );//Do
    
    keyRects[1] = CGRectMake([self view].bounds.size.width * 0.35 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.63,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.11// 1/6th width of screen
                             );//Di

    keyRects[2] = CGRectMake([self view].bounds.size.width * 0.65 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.240,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.11// 1/6th width of screen
                             );//Re
    
    keyRects[3] = CGRectMake([self view].bounds.size.width * 0.25 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.373,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.11// 1/6th width of screen
                             );//Ri/Me
    
    keyRects[4] = CGRectMake([self view].bounds.size.width * 0.65 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.515,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.11// 1/6th width of screen
                             );//Mi
    
    keyRects[5] = CGRectMake([self view].bounds.size.width * 0.35 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.13,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.11// 1/6th width of screen
                             );//Fa
    
    keyRects[6] = CGRectMake([self view].bounds.size.width * 0.457 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.68,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.09// 1/6th width of screen
                             );//Fi
 
    keyRects[7] = CGRectMake([self view].bounds.size.width * 0.56 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.13,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.11// 1/6th width of screen
                             );//Sol
    
    keyRects[8] = CGRectMake([self view].bounds.size.width * 0.27 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.515,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.11// 1/6th width of screen
                             );//Le
    
    keyRects[9] = CGRectMake([self view].bounds.size.width * 0.67 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.373,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.11// 1/6th width of screen
                             );//La
    
    keyRects[10] = CGRectMake([self view].bounds.size.width * 0.25 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.240,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.11// 1/6th width of screen
                             );//Re
    
    keyRects[11] = CGRectMake([self view].bounds.size.width * 0.56 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.63,//derive y
                             [self view].bounds.size.width * 0.1,//span across entire screen
                             [self view].bounds.size.height * 0.11// 1/6th width of screen
                             );//Ti
 
    keyRects[12] = CGRectMake([self view].bounds.size.width * 0.470 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.18,//derive y
                             [self view].bounds.size.width * 0.07,//span across entire screen
                             [self view].bounds.size.height * 0.027// 1/6th width of screen
                             );//Do
   //minors
    keyRects[13] = CGRectMake([self view].bounds.size.width * 0.35 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.39,//derive y
                             [self view].bounds.size.width * 0.05,//span across entire screen
                             [self view].bounds.size.height * 0.07// 1/6th width of screen
                             );//do
    
    keyRects[14] = CGRectMake([self view].bounds.size.width * 0.60 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.48,//derive y
                             [self view].bounds.size.width * 0.05,//span across entire screen
                             [self view].bounds.size.height * 0.07// 1/6th width of screen
                             );//di
    
    keyRects[15] = CGRectMake([self view].bounds.size.width * 0.42 + kXOrientationAdjustiPhone,//derive xi
                              [self view].bounds.size.height * 0.24,//derive y
                              [self view].bounds.size.width * 0.05,//span across entire screen
                              [self view].bounds.size.height * 0.07// 1/6th width of screen
                              );//re

//    keyRects[16] = CGRectMake(0, 40, 200, 40);//Ri
    keyRects[16] = CGRectMake([self view].bounds.size.width * 0.48 + kXOrientationAdjustiPhone,//derive xi
                              [self view].bounds.size.height * 0.57,//derive y
                              [self view].bounds.size.width * 0.05,//span across entire screen
                              [self view].bounds.size.height * 0.07// 1/6th width of screen
                              );//la
    
    keyRects[17] = CGRectMake([self view].bounds.size.width * 0.55 + kXOrientationAdjustiPhone,//derive xi
                              [self view].bounds.size.height * 0.24,//derive y
                              [self view].bounds.size.width * 0.05,//span across entire screen
                              [self view].bounds.size.height * 0.07// 1/6th width of screen
                              );//mi minor

    keyRects[18] = CGRectMake([self view].bounds.size.width * 0.37 + kXOrientationAdjustiPhone,//derive xi
                              [self view].bounds.size.height * 0.48,//derive y
                              [self view].bounds.size.width * 0.05,//span across entire screen
                              [self view].bounds.size.height * 0.07// 1/6th width of screen
                              );//fa
    
    keyRects[19] = CGRectMake([self view].bounds.size.width * 0.61 + kXOrientationAdjustiPhone,//derive xi
                              [self view].bounds.size.height * 0.39,//derive y
                              [self view].bounds.size.width * 0.05,//span across entire screen
                              [self view].bounds.size.height * 0.07// 1/6th width of screen
                              );//minor Do

    keyRects[20] = CGRectMake([self view].bounds.size.width * 0.37 + kXOrientationAdjustiPhone,//derive xi
                              [self view].bounds.size.height * 0.30,//derive y
                              [self view].bounds.size.width * 0.05,//span across entire screen
                              [self view].bounds.size.height * 0.07// 1/6th width of screen
                              );//sol

    keyRects[21] = CGRectMake([self view].bounds.size.width * 0.55 + kXOrientationAdjustiPhone,//derive xi
                              [self view].bounds.size.height * 0.54,//derive y
                              [self view].bounds.size.width * 0.05,//span across entire screen
                              [self view].bounds.size.height * 0.07// 1/6th width of screen
                              );//si

    keyRects[22] = CGRectMake([self view].bounds.size.width * 0.48 + kXOrientationAdjustiPhone,//derive xi
                             [self view].bounds.size.height * 0.23,//derive y
                             [self view].bounds.size.width * 0.05,//span across entire screen
                             [self view].bounds.size.height * 0.07// 1/6th width of screen
                             );//la
    
    keyRects[23] = CGRectMake([self view].bounds.size.width * 0.42 + kXOrientationAdjustiPhone,//derive xi
                              [self view].bounds.size.height * 0.54,//derive y
                              [self view].bounds.size.width * 0.05,//span across entire screen
                              [self view].bounds.size.height * 0.07// 1/6th width of screen
                              );//te minor

    keyRects[24] = CGRectMake([self view].bounds.size.width * 0.60 + kXOrientationAdjustiPhone,//derive xi
                              [self view].bounds.size.height * 0.30,//derive y
                              [self view].bounds.size.width * 0.05,//span across entire screen
                              [self view].bounds.size.height * 0.07// 1/6th width of screen
                              );//ti

    keyRects[25] = CGRectMake(0, 120, 200, 40);//Do

    
    
#if TARGET_IPHONE_SIMULATOR
    
    //For your convience in configuring keyRects. Pink Transparencies only displayed in Simulator
    
    UILabel *label0 = [ [UILabel alloc ] initWithFrame:keyRects[0] ];
    label0.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label0.text = [NSString stringWithFormat: @"keyRect[0]"];
    
    UILabel *label1 = [ [UILabel alloc ] initWithFrame:keyRects[1] ];
    label1.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label1.text = [NSString stringWithFormat: @"keyRect[1]"];
    
    UILabel *label2 = [ [UILabel alloc ] initWithFrame:keyRects[2] ];
    label2.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label2.text = [NSString stringWithFormat: @"keyRect[2]"];
    
    UILabel *label3 = [ [UILabel alloc ] initWithFrame:keyRects[3] ];
    label3.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label3.text = [NSString stringWithFormat: @"keyRect[3]"];
    
    UILabel *label4 = [ [UILabel alloc ] initWithFrame:keyRects[4] ];
    label4.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label4.text = [NSString stringWithFormat: @"keyRect[4]"];
    
    UILabel *label5 = [ [UILabel alloc ] initWithFrame:keyRects[5] ];
    label5.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label5.text = [NSString stringWithFormat: @"keyRect[5]"];
    
    UILabel *label6 = [ [UILabel alloc ] initWithFrame:keyRects[6] ];
    label6.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label6.text = [NSString stringWithFormat: @"keyRect[6]"];
    
    UILabel *label7 = [ [UILabel alloc ] initWithFrame:keyRects[7] ];
    label7.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label7.text = [NSString stringWithFormat: @"keyRect[7]"];
    
    UILabel *label8 = [ [UILabel alloc ] initWithFrame:keyRects[8] ];
    label8.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label8.text = [NSString stringWithFormat: @"keyRect[8]"];
    
    UILabel *label9 = [ [UILabel alloc ] initWithFrame:keyRects[9] ];
    label9.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label9.text = [NSString stringWithFormat: @"keyRect[9]"];
    
    UILabel *label10 = [ [UILabel alloc ] initWithFrame:keyRects[10] ];
    label10.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label10.text = [NSString stringWithFormat: @"keyRect[10]"];
    
    UILabel *label11 = [ [UILabel alloc ] initWithFrame:keyRects[11] ];
    label11.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label11.text = [NSString stringWithFormat: @"keyRect[11]"];
    
    UILabel *label12 = [ [UILabel alloc ] initWithFrame:keyRects[12] ];
    label12.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:1.000];
    label12.text = [NSString stringWithFormat: @"keyRect[12]"];
    
    
    
    UILabel *label13 = [ [UILabel alloc ] initWithFrame:keyRects[13] ];
    label13.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label13.text = [NSString stringWithFormat: @"keyRect[13]"];
    
    UILabel *label14 = [ [UILabel alloc ] initWithFrame:keyRects[14] ];
    label14.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label14.text = [NSString stringWithFormat: @"keyRect[14]"];
    
    UILabel *label15 = [ [UILabel alloc ] initWithFrame:keyRects[15] ];
    label15.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label15.text = [NSString stringWithFormat: @"keyRect[15]"];
    
    UILabel *label16 = [ [UILabel alloc ] initWithFrame:keyRects[16] ];
    label16.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label16.text = [NSString stringWithFormat: @"keyRect[16]"];
    
    UILabel *label17 = [ [UILabel alloc ] initWithFrame:keyRects[17] ];
    label17.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label17.text = [NSString stringWithFormat: @"keyRect[17]"];
    
    UILabel *label18 = [ [UILabel alloc ] initWithFrame:keyRects[18] ];
    label18.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label18.text = [NSString stringWithFormat: @"keyRect[18]"];
    
    UILabel *label19 = [ [UILabel alloc ] initWithFrame:keyRects[19] ];
    label19.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label19.text = [NSString stringWithFormat: @"keyRect[19]"];
    
    UILabel *label20 = [ [UILabel alloc ] initWithFrame:keyRects[20] ];
    label20.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label20.text = [NSString stringWithFormat: @"keyRect[20]"];
    
    UILabel *label21 = [ [UILabel alloc ] initWithFrame:keyRects[21] ];
    label21.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label21.text = [NSString stringWithFormat: @"keyRect[21]"];
    
    UILabel *label22 = [ [UILabel alloc ] initWithFrame:keyRects[22] ];
    label22.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label22.text = [NSString stringWithFormat: @"keyRect[22]"];
    
    UILabel *label23 = [ [UILabel alloc ] initWithFrame:keyRects[23] ];
    label23.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label23.text = [NSString stringWithFormat: @"keyRect[23]"];
    
    UILabel *label24 = [ [UILabel alloc ] initWithFrame:keyRects[24] ];
    label24.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label24.text = [NSString stringWithFormat: @"keyRect[24]"];
    
    UILabel *label25 = [ [UILabel alloc ] initWithFrame:keyRects[25] ];
    label25.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label25.text = [NSString stringWithFormat: @"keyRect[25]"];
    
    
    
    
    
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

    
    
#endif
    
    
    
    
    //create the mixer
    self.mixerHost = [[MixerHostAudio alloc] init];
    
    //start the audio graph
    [mixerHost startAUGraph];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [mixerHost stopAUGraph];

    self.mixerHost = nil;

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

// Handle a change in the mixer output gain slider.
- (IBAction) mixerOutputGainChanged: (UISlider *) sender {
    [mixerHost setMixerOutputGain: (AudioUnitParameterValue) sender.value];
}

#pragma mark -
#pragma mark Touch events

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *aTouch = [touches anyObject];
    int idx = [self keyIndexForTouch:aTouch];
    
    if (idx >= 0) {
        if ([mixerHost playNote:idx] == YES) {
            lastKeyIndex = idx;
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    lastKeyIndex = -1;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *aTouch = [touches anyObject];
    int idx = [self keyIndexForTouch:aTouch];
    
    if (idx >= 0 && idx != lastKeyIndex) {
        if ([mixerHost playNote:idx] == YES) {
            lastKeyIndex = idx;
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    lastKeyIndex = -1;
}

- (int)keyIndexForTouch:(UITouch *)touch {
    int keyIndex = -1;
    CGPoint pt = [touch locationInView:self.view];
    
    for (int i=0; i<KEY_COUNT; i++) {
        CGRect rect = keyRects[i];
        if (CGRectContainsPoint(rect, pt)) {
            keyIndex = i;
            break;
        }
    }
    
    return keyIndex;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    
    
    
    // Return YES for supported orientations
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
        return YES;
    }
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        return YES;
    }
    
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait){
        return YES;
    }
    
    if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        return YES;
    } else {return NO;}
    
    
    
    
}



@end
