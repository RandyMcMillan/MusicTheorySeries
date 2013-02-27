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

@synthesize toolbar, popoverController, detailItem, detailDescriptionLabel, imageViewA, tableView;
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
	[self drawRects:0];
	// [mixerHost stopAUGraph];

	// create the mixer
	self.mixerHost = [[MixerHostAudio alloc] init];

	// start the audio graph
	[mixerHost startAUGraph];

	[[UIDevice currentDevice]
		beginGeneratingDeviceOrientationNotifications];
	[[NSNotificationCenter defaultCenter]	addObserver :self selector:
		@selector(orientationChanged:)
											name		:UIDeviceOrientationDidChangeNotification object:nil];
}	/* viewDidLoad */

- (void)configureView
{
	// splitview config dont mess
	// Update the user interface for the detail item.
	detailDescriptionLabel.text		= [detailItem description];
	toggleItem.title				= ([splitController isShowingMaster]) ? @"Hide Master" : @"Show Master";// "I... AM... THE MASTER!" Derek Jacobi. Gave me chills.
	verticalItem.title				= (splitController.vertical) ? @"Horizontal Split" : @"Vertical Split";
	dividerStyleItem.title			= (splitController.dividerStyle == MGSplitViewDividerStyleThin) ? @"Enable Dragging" : @"Disable Dragging";
	masterBeforeDetailItem.title	= (splitController.masterBeforeDetail) ? @"Detail First" : @"Master First";

	// my config options

	//	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage originalSizeImageWithPDFNamed:@"TheGrandStaff.pdf"]];

	// self.imageViewA.image = imageView.image;
	// [imageView release];
	NSLog(@"imageViewA width = %f / height = %f ", imageViewA.bounds.size.width, imageViewA.bounds.size.height);
}

- (void)layoutSubViews
{
	// Do any additional setup after loading the view from its nib.
	float	screenWidth		= [UIScreen mainScreen].bounds.size.width;
	float	screenHeight	= [UIScreen mainScreen].bounds.size.height;
	CGFloat midX			= CGRectGetMidX(self.view.bounds);
	CGFloat midY			= CGRectGetMidY(self.view.bounds);

	self.viewA.center = CGPointMake(midX + 300, midY + 300);
	// [self.viewA setCenter:self.view.center];
	self.view.autoresizesSubviews = YES;

	if (self.view.bounds.size.width > self.view.bounds.size.height) {	// landscape
	} else {															// portrait
	}

	NSLog(@"screenWidth = %f screenHeight = %f", screenWidth, screenHeight);
	NSLog(@"viewWidth = %f viewHeight %f", self.view.bounds.size.width, self.view.bounds.size.height);
	NSLog(@"viewAWidth = %f viewAHeight %f \n\n", self.viewA.bounds.size.width, self.viewA.bounds.size.height);

	UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;

	if (UIDeviceOrientationIsLandscape(deviceOrientation) &&
		!self.isShowingLandscapeView) {
		[self performSegueWithIdentifier:@"DisplayAlternateView" sender:self];
		self.isShowingLandscapeView = YES;
	} else if (UIDeviceOrientationIsPortrait(deviceOrientation) &&
		self.isShowingLandscapeView) {
		[self dismissViewControllerAnimated:YES completion:nil];
		self.isShowingLandscapeView = NO;
	}
}

- (void)drawRects:(NSIndexPath *)indexPath
{
	CGFloat midX	= CGRectGetMidX(self.imageViewA.bounds);
	CGFloat midY	= CGRectGetMidY(self.imageViewA.bounds);

	NSLog(@"midX = %f midY = %f", midX, midY);
    //[mixerHost playNote:0];///manually trigger an audio event like this;
	if (indexPath.section == 0) {
		button0.center	= CGPointMake(midX + 30, midY + 30);
	}

	if (indexPath.section == 1) {}

	if (indexPath.section == 2) {}

	if (indexPath.section == 3) {}

	if (indexPath.section == 4) {}

	if (indexPath.section == 5) {}

	// define the note rectangles
/*	keyRects[0]		= label0.frame;	// C2;
	keyRects[1]		= label1.frame;
	keyRects[2]		= label2.frame;
	keyRects[3]		= label3.frame;
	keyRects[4]		= label4.frame;
	keyRects[5]		= label5.frame;
	keyRects[6]		= label6.frame;
	keyRects[7]		= label7.frame;
	keyRects[8]		= label8.frame;		// G2sharp;
	keyRects[9]		= label9.frame;
	keyRects[10]	= label10.frame;	// A2sharp;
	keyRects[11]	= label11.frame;
	keyRects[12] = label12.frame;
	keyRects[13]	= label13.frame;	// C3sharp;
	keyRects[14]	= label14.frame;
	keyRects[15]	= label15.frame;	// D3sharp;
	keyRects[16]	= label16.frame;
	keyRects[17]	= label17.frame;
	keyRects[18]	= label18.frame;	// F3sharp;
	keyRects[19]	= label19.frame;
	keyRects[20]	= label20.frame;	// G3sharp;
	keyRects[21]	= label21.frame;
	keyRects[22]	= label22.frame;	// A3sharp;
	keyRects[23]	= label23.frame;
	keyRects[24]    = label24.frame;
	keyRects[25]	= label25.frame;	// C4sharp;
	keyRects[26]	= label26.frame;
	keyRects[27]	= label27.frame;	// D4sharp;
	keyRects[28]	= label28.frame;
	keyRects[29]	= label29.frame;
	keyRects[30]	= label30.frame;	// F4sharp;
	keyRects[31]	= label31.frame;
	keyRects[32]	= label32.frame;	// G4sharp;
	keyRects[33]	= label33.frame;
	keyRects[34]	= label34.frame;	// A4sharp;
	keyRects[35]	= label35.frame;
	keyRects[36]    = label36.frame;
	keyRects[37]	= label37.frame;	// C5sharp;
	keyRects[38]	= label38.frame;
	keyRects[39]	= label39.frame;	// D5sharp;
	keyRects[40]	= label40.frame;
	keyRects[41]	= label41.frame;
	keyRects[42]	= label42.frame;// F5sharp;
	keyRects[43]	= label43.frame;

 */
    // keyRects[44]    = CGRectZero;//label44.frame;

	// #if TARGET_IPHONE_SIMULATOR
	// displayed in Simulator
	// #endif	/* if TARGET_IPHONE_SIMULATOR */

	NSLog(@"imageViewA width = %f / height = %f ", imageViewA.bounds.size.width, imageViewA.bounds.size.height);
}	/* drawRects */

- (void)destroyRects
{
    //	for (UIView *subview in [self.view subviews]) {
		//if (subview == label0) {
        //		[subview removeFromSuperview];
		//}

	//}
}	/* destroyRects */

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
	cell.textLabel.text				= [NSString stringWithFormat:@"DetailVC Row %d", indexPath.row];
	self.tableView.backgroundColor	=
		[UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:0.000];
	self.tableView.separatorColor	= [UIColor lightGrayColor];
	cell.textLabel.font				= [UIFont fontWithName:@"Helvetica" size:18.0];
	cell.textLabel.backgroundColor	= [UIColor clearColor];
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
	// [self destroyRects];
	// [self drawRects];

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
    //	CGPoint pt			= [touch locationInView:self.view];
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



#pragma mark -
#pragma mark Play Note

- (IBAction)playNote:(id)sender {

    [mixerHost playNote:0];
 
    
}


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
		// hides Popover button
		// [items insertObject:barButtonItem atIndex:0];
		// removes enable dragging btn
		[items removeObject:dividerStyleItem];
		// removes horizontal/vert splt btn
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
	[self drawRects:0];
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

- (void)orientationChanged:(NSNotification *)notification
{
	// We must add a delay here, otherwise we'll swap in the new view
	// too quickly and we'll get an animation glitch
	// [self performSelector:@selector(updateLandscapeView) withObject:nil
	// afterDelay:0];

	NSLog(@"orientationChanged");
	NSLog(@"imageViewA width = %f / height = %f ", imageViewA.bounds.size.width, imageViewA.bounds.size.height);

	if (self.view.bounds.size.width > self.view.bounds.size.height) {
		self.isShowingLandscapeView = NO;
	} else {
		self.isShowingLandscapeView = YES;
	}

	NSLog(@" self.isShowingLandscapeView = %i", self.isShowingLandscapeView);
}

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	[self configureView];
	[self drawRects:0];
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
