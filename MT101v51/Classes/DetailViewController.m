//
//  DetailViewController.m
//  MGSplitView
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright Instinctive Code 2010.
//

#import "DetailViewController.h"
#import "RootViewController.h"

@interface DetailViewController ()

@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;

@end

@implementation DetailViewController

@synthesize toolbar, popoverController, detailItem, detailDescriptionLabel,imageViewA,tableView;
@synthesize mixerHost;

#pragma mark -
#pragma mark Managing the detail item

// When setting the detail item, update the view and dismiss the popover controller if it's showing.
- (void)setDetailItem:(id)newDetailItem
{
	if (detailItem != newDetailItem) {
		[detailItem release];
		detailItem = [newDetailItem retain];

		// Update the view.
		[self configureView];
	}

	if (popoverController != nil) {
		[popoverController dismissPopoverAnimated:YES];
	}
       
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self drawRects];
    //[mixerHost stopAUGraph];
    
    // create the mixer
    self.mixerHost = [[MixerHostAudio alloc] init];
    
    // start the audio graph
    [mixerHost startAUGraph];
} /* viewDidLoad */



- (void)configureView
{
    
    //splitview config dont mess
	// Update the user interface for the detail item.
	detailDescriptionLabel.text		= [detailItem description];
	toggleItem.title				= ([splitController isShowingMaster]) ? @"Hide Master" : @"Show Master";// "I... AM... THE MASTER!" Derek Jacobi. Gave me chills.
	verticalItem.title				= (splitController.vertical) ? @"Horizontal Split" : @"Vertical Split";
	dividerStyleItem.title			= (splitController.dividerStyle == MGSplitViewDividerStyleThin) ? @"Enable Dragging" : @"Disable Dragging";
	masterBeforeDetailItem.title	= (splitController.masterBeforeDetail) ? @"Detail First" : @"Master First";
    
    
    //my config options
    
    
    UIImageView *imageView = [[ UIImageView alloc ] initWithImage:[ UIImage originalSizeImageWithPDFNamed:@"TheGrandStaff.pdf"  ]];
    
    self.imageViewA.image = imageView.image;
    [imageView release];
 
    
}

-(void)layoutSubViews{
    
    
    // Do any additional setup after loading the view from its nib.
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float screenHeight = [UIScreen mainScreen].bounds.size.height;
    //[self.viewA setCenter:self.view.center];
    self.view.autoresizesSubviews = YES;
    if (self.view.bounds.size.width > self.view.bounds.size.height) {//landscape
        
    }else{//portrait
        
    }
    
    
    NSLog(@"screenWidth = %f screenHeight = %f",screenWidth,screenHeight);
    NSLog(@"viewWidth = %f viewHeight %f",self.view.bounds.size.width,self.view.bounds.size.height);
    NSLog(@"viewAWidth = %f viewAHeight %f \n\n",self.viewA.bounds.size.width,self.viewA.bounds.size.height);
    
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


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView
{
	// Return the number of sections.
	return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section
{
	// Return the number of rows in the section.
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CellIdentifier";
    
	// Dequeue or create a cell of the appropriate type.
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
    
	// Configure the cell.
	cell.textLabel.text = [NSString stringWithFormat:@"DetailVC Row %d", indexPath.row];
    self.tableView.backgroundColor =
    [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:0.000];
    self.tableView.separatorColor = [UIColor lightGrayColor];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:18.0];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    //    cell.imageView.layer.cornerRadius = 5.0;

	return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
	// When a row is selected, set the detail view controller's detail item to the item associated with the selected row.
    self.detailItem = [NSString stringWithFormat:@"From detailVC Row %d", indexPath.row];
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
    //[self destroyRects];
    //[self drawRects];
    
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



#pragma mark -
#pragma mark Split view support

- (void)splitViewController		:(MGSplitViewController *)svc
		willHideViewController	:(UIViewController *)aViewController
		withBarButtonItem		:(UIBarButtonItem *)barButtonItem
		forPopoverController	:(UIPopoverController *)pc
{
	// NSLog(@"%@", NSStringFromSelector(_cmd));

	if (barButtonItem) {
		barButtonItem.title = @"Popover";
		NSMutableArray *items = [[toolbar items] mutableCopy];
		//hides Popover button
        //[items insertObject:barButtonItem atIndex:0];
		//removes enable dragging btn
        [items removeObject:dividerStyleItem];
        //removes horizontal/vert splt btn
        [items removeObject:verticalItem];
        [toolbar setItems:items animated:YES];
		[items release];
	}

	self.popoverController = pc;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController			:(MGSplitViewController *)svc
		willShowViewController		:(UIViewController *)aViewController
		invalidatingBarButtonItem	:(UIBarButtonItem *)barButtonItem
{
	// NSLog(@"%@", NSStringFromSelector(_cmd));

	if (barButtonItem) {
		NSMutableArray *items = [[toolbar items] mutableCopy];
		[items removeObject:barButtonItem];
		[toolbar setItems:items animated:YES];
		[items release];
	}

	self.popoverController = nil;
}

- (void)splitViewController			:(MGSplitViewController *)svc
		popoverController			:(UIPopoverController *)pc
		willPresentViewController	:(UIViewController *)aViewController
{
	// NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)splitViewController:(MGSplitViewController *)svc willChangeSplitOrientationToVertical:(BOOL)isVertical
{
	// NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)splitViewController:(MGSplitViewController *)svc willMoveSplitToPosition:(float)position
{
	// NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (float)splitViewController:(MGSplitViewController *)svc constrainSplitPosition:(float)proposedPosition splitViewSize:(CGSize)viewSize
{
	// NSLog(@"%@", NSStringFromSelector(_cmd));
	return proposedPosition;
}

#pragma mark -
#pragma mark Actions

- (IBAction)toggleMasterView:(id)sender
{
	[splitController toggleMasterView:sender];
	[self configureView];
}

- (IBAction)toggleVertical:(id)sender
{
	[splitController toggleSplitOrientation:self];
	[self configureView];
}

- (IBAction)toggleDividerStyle:(id)sender
{
	MGSplitViewDividerStyle newStyle = ((splitController.dividerStyle == MGSplitViewDividerStyleThin) ? MGSplitViewDividerStylePaneSplitter : MGSplitViewDividerStyleThin);

	[splitController setDividerStyle:newStyle animated:YES];
	[self configureView];
}

- (IBAction)toggleMasterBeforeDetail:(id)sender
{
	[splitController toggleMasterBeforeDetail:sender];
	[self configureView];
}

#pragma mark -
#pragma mark Rotation support

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	[self configureView];
}

- (void)dealloc
{
	[popoverController release];
	[toolbar release];

	[detailItem release];
	[detailDescriptionLabel release];
	[super dealloc];
}

@end
