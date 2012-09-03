//

//  AppleXylophone.m
//  AudioMeetupDemo
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//
#import "SopranoClefViewController.h"
#import "GradientButton.h"
#import "GradientToolBar.h"
@implementation SopranoClefViewController

@synthesize mixerHost;

- (void)dealloc
{
	[super dealloc];
	[mixerHost release];
}

- (void)closeBrowser
{
	if ([self respondsToSelector:@selector(presentingViewController)]) {
		[[self presentingViewController]	dismissViewControllerAnimated	:
			YES								completion						:nil];
	} else {
		[[self parentViewController] dismissModalViewControllerAnimated
			:YES];
	}

	[mixerHost stopAUGraph];

	self.mixerHost = nil;
}	/* closeBrowser */

- (IBAction)onDoneButtonPress:(id)sender
{
	[self closeBrowser];
}

- (void)drawRects
{
	// define the "key" xylophone note rectangles
	keyRects[0] = CGRectMake([self view].center.x - 42,		// derive xi
		[self view].center.y - 285,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Do

	keyRects[1] = CGRectMake([self view].center.x + 70,		// derive xi
		[self view].center.y - 255,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Di

	keyRects[2] = CGRectMake([self view].center.x + 150,	// derive xi
		[self view].center.y - 175,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Re

	keyRects[3] = CGRectMake([self view].center.x + 174,	// derive xi
		[self view].center.y - 67,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Ri

	keyRects[4] = CGRectMake([self view].center.x + 150,	// derive xi
		[self view].center.y + 57,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Mi

	keyRects[5] = CGRectMake([self view].center.x + 65,		// derive xi
		[self view].center.y + 120,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Fa

	keyRects[6] = CGRectMake([self view].center.x - 42,		// derive xi
		[self view].center.y + 145,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Fi

	keyRects[7] = CGRectMake([self view].center.x - 150,	// derive xi
		[self view].center.y + 120,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Sol

	keyRects[8] = CGRectMake([self view].center.x - 240,	// derive xi
		[self view].center.y + 37,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Si

	keyRects[9] = CGRectMake([self view].center.x - 250,	// derive xi
		[self view].center.y - 67,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// La

	keyRects[10] = CGRectMake([self view].center.x - 230,	// derive xi
		[self view].center.y - 170,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Li

	keyRects[11] = CGRectMake([self view].center.x - 155,	// derive xi
		[self view].center.y - 255,							// derive y
		BIGBOXWIDTH,										// span across entire screen
		BIGBOXHEIGHT										// 1/6th width of screen
		);													// Ti

	keyRects[12] = CGRectMake(0, 0, 0, 0);

	//    keyRects[12] = CGRectMake([self view].center.x - 0,//derive xi
	//                           [self view].center.y - 0,//derive y
	//                         BIGBOXWIDTH,//span across entire screen
	//                       BIGBOXHEIGHT// 1/6th width of screen
	//                     );//Do
	// minors
	keyRects[13] = CGRectMake([self view].center.x + 41,	// derive xi
		[self view].center.y + 65,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// do

	keyRects[14] = CGRectMake([self view].center.x - 22.5,	// derive xi
		[self view].center.y + 70,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// di

	keyRects[15] = CGRectMake([self view].center.x - 85,	// derive xi
		[self view].center.y + 65,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// re

	keyRects[16] = CGRectMake([self view].center.x - 140,	// derive xi
		[self view].center.y + 20,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// ri

	keyRects[17] = CGRectMake([self view].center.x - 150,	// derive xi
		[self view].center.y - 50,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// mi

	keyRects[18] = CGRectMake([self view].center.x - 140,	// derive xi
		[self view].center.y - 120,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// fa

	keyRects[19] = CGRectMake([self view].center.x - 90,	// derive xi
		[self view].center.y - 160,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// fi

	keyRects[20] = CGRectMake([self view].center.x - 22.5,	// derive xi
		[self view].center.y - 180,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// sol

	keyRects[21] = CGRectMake([self view].center.x + 40,	// derive xi
		[self view].center.y - 160,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// si

	keyRects[22] = CGRectMake([self view].center.x + 90,	// derive xi
		[self view].center.y - 120,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// la

	keyRects[23] = CGRectMake([self view].center.x + 110,	// derive xi
		[self view].center.y - 50,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// li

	keyRects[24] = CGRectMake([self view].center.x + 90,	// derive xi
		[self view].center.y + 15,							// derive y
		SMALLBOXWIDTH,										// span across entire screen
		SMALLBOXHEIGHT										// 1/6th width of screen
		);													// ti

	keyRects[25] = CGRectMake(0, 0, 0, 0);

	// keyRects[25] = CGRectMake([self view].center.x + 40,//derive xi
	//                        [self view].center.y + 70,//derive y
	//                      SMALLBOXWIDTH,//span across entire screen
	//                    SMALLBOXHEIGHT// 1/6th width of screen
	//                  );//do

	// #if TARGET_IPHONE_SIMULATOR

	// For your convience in configuring keyRects. Pink Transparencies only
	// displayed in Simulator

	label0 = [[UILabel alloc] initWithFrame:keyRects[0]];
	label0.backgroundColor	= DO;
	label0.text				= [NSString stringWithFormat:@"keyRect[0]"];

	label1 = [[UILabel alloc] initWithFrame:keyRects[1]];
	label1.backgroundColor	= DI;
	label1.text				= [NSString stringWithFormat:@"keyRect[1]"];

	label2 = [[UILabel alloc] initWithFrame:keyRects[2]];
	label2.backgroundColor	= RE;
	label2.text				= [NSString stringWithFormat:@"keyRect[2]"];

	label3 = [[UILabel alloc] initWithFrame:keyRects[3]];
	label3.backgroundColor	= RI;
	label3.text				= [NSString stringWithFormat:@"keyRect[3]"];

	label4 = [[UILabel alloc] initWithFrame:keyRects[4]];
	label4.backgroundColor = MI;	// [UIColor colorWithRed:0.024
									// green:0.000 blue:1.000 alpha:1.000];
	label4.text = [NSString stringWithFormat:@"keyRect[4]"];

	label5 = [[UILabel alloc] initWithFrame:keyRects[5]];
	label5.backgroundColor = FA;	// [UIColor colorWithRed:0.255
									// green:0.000 blue:0.663 alpha:1.000];
	label5.text = [NSString stringWithFormat:@"keyRect[5]"];

	label6 = [[UILabel alloc] initWithFrame:keyRects[6]];
	label6.backgroundColor = FI;	// [UIColor colorWithRed:0.357
									// green:0.000 blue:0.663 alpha:1.000];
	label6.text = [NSString stringWithFormat:@"keyRect[6]"];

	label7 = [[UILabel alloc] initWithFrame:keyRects[7]];
	label7.backgroundColor = SOL;	// [UIColor colorWithRed:0.541
									// green:0.000 blue:0.796 alpha:1.000];
	label7.text = [NSString stringWithFormat:@"keyRect[7]"];

	label8 = [[UILabel alloc] initWithFrame:keyRects[8]];
	label8.backgroundColor = SI;	// [UIColor colorWithRed:0.702
									// green:0.000 blue:0.486 alpha:1.000];
	label8.text = [NSString stringWithFormat:@"keyRect[8]"];

	label9 = [[UILabel alloc] initWithFrame:keyRects[9]];
	label9.backgroundColor = LA;	// [UIColor colorWithRed:0.788
									// green:0.043 blue:0.102 alpha:1.000];
	label9.text = [NSString stringWithFormat:@"keyRect[9]"];

	label10 = [[UILabel alloc] initWithFrame:keyRects[10]];
	label10.backgroundColor = LI;	// [UIColor colorWithRed:0.788
									// green:0.043 blue:0.102 alpha:1.000];
	label10.text = [NSString stringWithFormat:@"keyRect[10]"];

	label11 = [[UILabel alloc] initWithFrame:keyRects[11]];
	label11.backgroundColor = TI;	// [UIColor colorWithRed:0.992
									// green:0.518 blue:0.129 alpha:1.000];
	label11.text = [NSString stringWithFormat:@"keyRect[11]"];

	label12 = [[UILabel alloc] initWithFrame:keyRects[12]];
	label12.backgroundColor = DO;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:1.000];
	label12.text = [NSString stringWithFormat:@"keyRect[12]"];

	// minors
	label13 = [[UILabel alloc] initWithFrame:keyRects[13]];
	label13.backgroundColor = DO;	// [UIColor colorWithRed:1.000
									// green:1.000 blue:0.043 alpha:1.000];
	label13.text = [NSString stringWithFormat:@"keyRect[13]"];

	label14 = [[UILabel alloc] initWithFrame:keyRects[14]];
	label14.backgroundColor = DI;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label14.text = [NSString stringWithFormat:@"keyRect[14]"];

	label15 = [[UILabel alloc] initWithFrame:keyRects[15]];
	label15.backgroundColor = RE;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label15.text = [NSString stringWithFormat:@"keyRect[15]"];

	label16 = [[UILabel alloc] initWithFrame:keyRects[16]];
	label16.backgroundColor = RI;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label16.text = [NSString stringWithFormat:@"keyRect[16]"];

	label17 = [[UILabel alloc] initWithFrame:keyRects[17]];
	label17.backgroundColor = MI;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label17.text = [NSString stringWithFormat:@"keyRect[17]"];

	label18 = [[UILabel alloc] initWithFrame:keyRects[18]];
	label18.backgroundColor = FA;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label18.text = [NSString stringWithFormat:@"keyRect[18]"];

	label19 = [[UILabel alloc] initWithFrame:keyRects[19]];
	label19.backgroundColor = FI;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label19.text = [NSString stringWithFormat:@"keyRect[19]"];

	label20 = [[UILabel alloc] initWithFrame:keyRects[20]];
	label20.backgroundColor = SOL;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839
									// alpha:0.500];
	label20.text = [NSString stringWithFormat:@"keyRect[20]"];

	label21 = [[UILabel alloc] initWithFrame:keyRects[21]];
	label21.backgroundColor = SI;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label21.text = [NSString stringWithFormat:@"keyRect[21]"];

	label22 = [[UILabel alloc] initWithFrame:keyRects[22]];
	label22.backgroundColor = LA;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label22.text = [NSString stringWithFormat:@"keyRect[22]"];

	label23 = [[UILabel alloc] initWithFrame:keyRects[23]];
	label23.backgroundColor = LI;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label23.text = [NSString stringWithFormat:@"keyRect[23]"];

	label24 = [[UILabel alloc] initWithFrame:keyRects[24]];
	label24.backgroundColor = TI;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label24.text = [NSString stringWithFormat:@"keyRect[24]"];

	label25 = [[UILabel alloc] initWithFrame:keyRects[25]];
	label25.backgroundColor = DO;	// [UIColor colorWithRed:1.000
									// green:0.820 blue:0.839 alpha:0.500];
	label25.text = [NSString stringWithFormat:@"keyRect[25]"];

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

	// minors
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

	// #endif
}	/* drawRects */

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
	}
}	/* destroyRects */

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
    [toolBar useTBStyle];
	[closeButton useDoneButtonStyle];
    
[mixerHost stopAUGraph];
	imageView.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
		UIViewAutoresizingFlexibleHeight);

	imageView.contentMode = UIViewContentModeScaleAspectFit;
	[[UIDevice currentDevice]
		beginGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter]	addObserver :self selector:
		@selector(orientationChanged:)
											name		:UIDeviceOrientationDidChangeNotification object:nil];

	// create the mixer
	self.mixerHost = [[MixerHostAudio alloc] init];

	// start the audio graph
	[mixerHost startAUGraph];
}	/* viewDidLoad */

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
	int		idx		= [self keyIndexForTouch:aTouch];

	if (idx >= 0) {
		if ([mixerHost playNote:idx] == YES) {
			lastKeyIndex = idx;
		}
	}
}	/* touchesBegan */

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	lastKeyIndex = -1;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *aTouch = [touches anyObject];
	int		idx		= [self keyIndexForTouch:aTouch];

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
	int		keyIndex	= -1;
	CGPoint pt			= [touch locationInView:self.view];

	for (int i = 0; i < KEY_COUNT; i++) {
		CGRect rect = keyRects[i];

		if (CGRectContainsPoint(rect, pt)) {
			keyIndex = i;
			break;
		}
	}

	return keyIndex;
}	/* keyIndexForTouch */

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
}	/* shouldAutorotateToInterfaceOrientation */

- (BOOL)didAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
   currentInterfaceOrientation
{
	NSLog(@"did auto rotate");
	return YES;
}

@end
