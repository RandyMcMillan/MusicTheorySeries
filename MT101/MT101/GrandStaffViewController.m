//
//  AppleXylophone.m
//  AudioMeetupDemo
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
#import "GrandStaffViewController.h"

@implementation GrandStaffViewController

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
    keyRects[0] = CGRectMake(0, 0, 200, 40);
    keyRects[1] = CGRectMake(0, 40, 200, 40);
    keyRects[2] = CGRectMake(0, 80, 200, 40);
    keyRects[3] = CGRectMake(0, 120, 200, 40);
    keyRects[4] = CGRectMake(0, 160, 200, 40);
    keyRects[5] = CGRectMake(0, 200, 200, 40);
    keyRects[6] = CGRectMake(0, 240, 200, 40);
    keyRects[7] = CGRectMake(0, 280, 200, 40);
    keyRects[8] = CGRectMake(0, 320, 200, 40);
    keyRects[9] = CGRectMake(0, 360, 200, 40);
    keyRects[10] = CGRectMake(0, 400, 200, 40);
    keyRects[11] = CGRectMake(0, 440, 200, 40);
    keyRects[12] = CGRectMake(0, 480, 200, 40);

    
    
    
#if TARGET_IPHONE_SIMULATOR
    
    //For your convience in configuring keyRects. Pink Transparencies only displayed in Simulator
    
    UILabel *label0 = [ [UILabel alloc ] initWithFrame:keyRects[0] ];
    label0.numberOfLines = 3;
    label0.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label0.text = [NSString stringWithFormat: @"keyRect[0]\nOnly displayed in Simulator"];
    
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
    label12.backgroundColor = [UIColor colorWithRed:1.000 green:0.820 blue:0.839 alpha:0.500];
    label12.text = [NSString stringWithFormat: @"keyRect[12]"];

    
    
    
    
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


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    self.mixerHost = nil;
    
    // Release any cached data, images, etc that aren't in use.
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

- (BOOL)didAutorotateToInterfaceOrientation:(UIInterfaceOrientation)currentInterfaceOrientation {
    
    NSLog(@"did auto rotate");
    return YES;
    
}



@end
