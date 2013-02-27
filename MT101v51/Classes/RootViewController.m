//
//  RootViewController.m
//  MGSplitView
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright Instinctive Code 2010.
//

#import "RootViewController.h"
#import "DetailViewController.h"

@implementation RootViewController

@synthesize detailViewController, isCircleView;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.clearsSelectionOnViewWillAppear	= NO;
	self.contentSizeForViewInPopover		= CGSizeMake(320.0, 600.0);

	self.tableView.showsVerticalScrollIndicator = NO;

#pragma mark - Section Headers

	NSString *sectionHeadersPath =
		[[NSBundle mainBundle] pathForResource:@"RootSections" ofType:
		@"plist"];
	rootSection =
		[[NSArray alloc] initWithContentsOfFile:sectionHeadersPath];

	for (NSString *str in rootSection) {
		NSLog(@"section = %@", str);
	}

#pragma mark - Cell Icons

	NSString *rootVCIconPath =
		[[NSBundle mainBundle] pathForResource:@"RootVCIcons" ofType:@"plist"];
	rootVCIcon = [[NSArray alloc] initWithContentsOfFile:rootVCIconPath];

	for (NSString *str in rootVCIcon) {
		NSLog(@"cellIcon = %@", str);
	}

#pragma mark - SubView Lists
    
    NSString *subViewListPath0 =
    [[NSBundle mainBundle] pathForResource:@"subViewList0" ofType:@"plist"];
	subViewList0 = [[NSArray alloc] initWithContentsOfFile:subViewListPath0];
    
	for (NSString *str in subViewList0) {
		NSLog(@"subViewList0 = %@", str);
	}
 

}

- (void)selectFirstRow
{
if (([self.tableView numberOfSections] > 0) && ([self.tableView numberOfRowsInSection:0] > 0)) {
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
		[self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
		// [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];

		CGFloat midX	= CGRectGetMidX(detailViewController.viewA.bounds);
		CGFloat midY	= CGRectGetMidY(detailViewController.viewA.bounds);
		detailViewController.imageViewA.center	= CGPointMake(midX, midY);
		detailViewController.imageViewA.image	= [UIImage originalSizeImageWithPDFNamed:@"Welcome"];
		[self layoutImageView];
		[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	}
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView
{
	// Return the number of sections.
	// return 1;
	return [rootSection count];
}

- (NSString *)	tableView				:(UITableView *)tableView
				titleForHeaderInSection :(NSInteger)section
{
	//  The header for the section is the region name -- get this from the
	//  region at the section index.
	//  Region *region = [regions objectAtIndex:section];

	return [rootSection objectAtIndex:section];	// sectionHeaders;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section
{
	// Return the number of rows in the section.
	// return 10;
	return 1;	// [rootVCIcon count];
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

	// Style the tableView
	tableView.rowHeight			= 150.0;
	tableView.backgroundColor	=
		[UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.000];
	tableView.separatorColor = [UIColor lightGrayColor];

	// Configure the cell
	cell.textLabel.font				= [UIFont fontWithName:@"Helvetica" size:8.0];
	cell.textLabel.backgroundColor	= [UIColor clearColor];
	// cell.imageView.layer.cornerRadius = 5.0;
	// cell.textLabel.text = [NSString stringWithFormat:@"%d RVC", indexPath.row];

	// if (indexPath.section == 0) {
	//    cell.imageView.image	= [UIImage originalSizeImageWithPDFNamed:@"StaffIcon.pdf"];
	cell.imageView.image = [UIImage originalSizeImageWithPDFNamed:rootVCIcon[indexPath.section]];
	// }

	cell.imageView.center = cell.center;

	return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];

	// When a row is selected, set the detail view controller's detail item to the item associated with the selected row.
	//	detailViewController.detailItem = [NSString stringWithFormat:@"From RootVC Row %d", indexPath.row];
	detailViewController.detailItem = [NSString stringWithFormat:@"From RootVC Row %@", subViewList0[indexPath.row]];

	// UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage originalSizeImageWithPDFNamed:@"TheGrandStaff.pdf"]];
	// detailViewController.imageViewA.image = [UIImage originalSizeImageWithPDFNamed:@"TheGrandStaff.pdf"];

	if (indexPath.section == 0) {
		isCircleView = FALSE;
		//detailViewController.imageViewA.image = [UIImage originalSizeImageWithPDFNamed:imageList0[indexPath.row]];
		[UIView animateWithDuration:0.5 delay:0.5  options:UIViewAnimationCurveEaseOut animations:^{}   completion:^(BOOL finished) {}];
	}

	if (indexPath.section == 1) {
		isCircleView = TRUE;
		//detailViewController.imageViewA.image = [UIImage originalSizeImageWithPDFNamed:imageList1[indexPath.row]];
		[UIView animateWithDuration:0.5 delay:0.5  options:UIViewAnimationCurveEaseOut animations:^{}   completion:^(BOOL finished) {}];
	}

	if (indexPath.section == 2) {
		isCircleView = FALSE;
		//detailViewController.imageViewA.image = [UIImage originalSizeImageWithPDFNamed:imageList2[indexPath.row]];
		[UIView animateWithDuration:0.5 delay:0.5  options:UIViewAnimationCurveEaseOut animations:^{}   completion:^(BOOL finished) {}];
	}

	if (indexPath.section == 3) {
		isCircleView = TRUE;
		//detailViewController.imageViewA.image = [UIImage originalSizeImageWithPDFNamed:imageList3[indexPath.row]];
		[UIView animateWithDuration:0.5 delay:0.5  options:UIViewAnimationCurveEaseOut animations:^{}   completion:^(BOOL finished) {}];
	}

	if (indexPath.section == 4) {
		isCircleView = FALSE;
		//detailViewController.imageViewA.image = [UIImage originalSizeImageWithPDFNamed:imageList4[indexPath.row]];
		[UIView animateWithDuration:0.5 delay:0.5  options:UIViewAnimationCurveEaseOut animations:^{}   completion:^(BOOL finished) {}];
	}

	[self layOut];
}

- (void)layOut
{
	[UIView animateWithDuration:0.2 delay:0.0  options:UIViewAnimationCurveEaseOut animations:^{
			detailViewController.imageViewA.alpha = 5.0;
		}   completion:^(BOOL finished) {}];

	NSLog (@"%i", isCircleView);
	[self layoutImageView];
	[self layoutCircleView];
}

- (void)layoutImageView
{
	if (!isCircleView) {
		[UIView animateWithDuration:0.3 delay:0.0  options:UIViewAnimationCurveEaseOut animations:^{
				[detailViewController.imageViewA setBounds:CGRectMake (0, 0, detailViewController.viewA.bounds.size.width * 0.9, detailViewController.viewA.bounds.size.height * 0.8)];
				// detailViewController.imageViewA.center = detailViewController.viewA.center;
				CGFloat midX = CGRectGetMidX (detailViewController.viewA.bounds);
				CGFloat midY = CGRectGetMidY (detailViewController.viewA.bounds);
				detailViewController.imageViewA.center = CGPointMake (midX, midY);

				// [detailViewController.imageViewA setCenter:CGPointMake(detailViewController.viewA.center.x, detailViewController.viewA.center.y-30)];
				detailViewController.imageViewA.alpha = 1.0;
			}   completion:^(BOOL finished) {}];
	}
}

- (void)layoutCircleView
{
	if (isCircleView) {
		[UIView animateWithDuration:0.3 delay:0.0  options:UIViewAnimationCurveEaseOut animations:^{
				// detailViewController.imageViewA.center = detailViewController.viewA.center;
				CGFloat midX = CGRectGetMidX (detailViewController.viewA.bounds);
				CGFloat midY = CGRectGetMidY (detailViewController.viewA.bounds);
				[detailViewController.imageViewA setBounds:CGRectMake (0, 0, detailViewController.viewA.bounds.size.width * 0.9, detailViewController.viewA.bounds.size.height * 0.8)];

				detailViewController.imageViewA.center = CGPointMake (midX, midY);

				// [detailViewController.imageViewA setCenter:CGPointMake(detailViewController.viewA.center.x, detailViewController.viewA.center.y-30)];
				detailViewController.imageViewA.alpha = 1.0;
			}   completion:^(BOOL finished) {}];
	}
};

#pragma mark -
#pragma mark orientation Support
// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	[self layoutImageView];
	[self layoutCircleView];
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
	[detailViewController release];
	[super dealloc];
}

@end
