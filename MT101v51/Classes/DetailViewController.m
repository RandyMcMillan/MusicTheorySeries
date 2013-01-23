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

@synthesize toolbar, popoverController, detailItem, detailDescriptionLabel,imageViewA;

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
		[items insertObject:barButtonItem atIndex:0];
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
