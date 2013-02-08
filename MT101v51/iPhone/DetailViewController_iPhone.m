//
//  DetailViewController_iPhone.m
//  MGSplitView
//
//  Created by Randy McMillan on 1/1/13.
//
//

#import "DetailViewController_iPhone.h"

@interface DetailViewController_iPhone ()

@end

@implementation DetailViewController_iPhone
@synthesize detailItem;
@synthesize toolbar;
@synthesize detailDescriptionLabel;
@synthesize viewA, viewB, imageViewA, imageViewB;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

	if (self) {
		// Custom initialization
	}

	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self layoutSubViews];
}

- (void)setDetailItem:(id)newDetailItem
{
	if (detailItem != newDetailItem) {
		[detailItem release];
		detailItem = [newDetailItem retain];

		// Update the view.
		[self configureView];
	}
}

- (void)configureView
{
	// Update the user interface for the detail item.
	detailDescriptionLabel.text = [detailItem description];

	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage originalSizeImageWithPDFNamed:@"TheGrandStaff.pdf"]];
	self.imageViewA.image = imageView.image;
	[imageView release];
}

- (void)layoutSubViews
{
	// Do any additional setup after loading the view from its nib.
	float	screenWidth		= [UIScreen mainScreen].bounds.size.width;
	float	screenHeight	= [UIScreen mainScreen].bounds.size.height;

	// [self.viewA setCenter:self.view.center];
	self.view.autoresizesSubviews = YES;

	if (self.view.bounds.size.width > self.view.bounds.size.height) {	// landscape
	} else {// portrait
	}

	NSLog(@"screenWidth = %f screenHeight = %f", screenWidth, screenHeight);
	NSLog(@"viewWidth = %f viewHeight %f", self.view.bounds.size.width, self.view.bounds.size.height);
	NSLog(@"viewAWidth = %f viewAHeight %f \n\n", self.viewA.bounds.size.width, self.viewA.bounds.size.height);
}

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
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryNone;
	}

	// Configure the cell.
	cell.textLabel.text			= [NSString stringWithFormat:@"Row %d", indexPath.row];
	tableView.backgroundColor	=
		[UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.000];
	tableView.separatorColor		= [UIColor lightGrayColor];
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

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	[self layoutSubViews];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
