//
//  RootViewController_iPhone.m
//  MGSplitView
//
//  Created by Randy McMillan on 11/17/12.
//
//

#import "RootViewController_iPhone.h"
#import "DetailViewController_iPhone.h"

@implementation RootViewController_iPhone

@synthesize detailViewController_iPhone;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.clearsSelectionOnViewWillAppear	= NO;
	self.contentSizeForViewInPopover		= CGSizeMake(320.0, 600.0);
	self.title = @"Examples";
}

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)selectFirstRow
{
	if (([self.tableView numberOfSections] > 0) && ([self.tableView numberOfRowsInSection:0] > 0)) {
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
		[self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
		[self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
	}
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

// Customize the appearance of table view cells.
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
	// cell.imageView.image = [UIImage imageNamed:[cellIcon0 objectAtIndex:indexPath.row]];
	cell.imageView.image = [UIImage originalSizeImageWithPDFNamed:@"StaffIcon.pdf"];

	return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];

	if (IS_IPAD()) {} else {
		[self.navigationController pushViewController:detailViewController_iPhone animated:YES];
	}

	// When a row is selected, set the detail view controller's detail item to the item associated with the selected row.
	//	detailViewController_iPhone.detailDescriptionLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];

	detailViewController_iPhone.detailItem = [NSString stringWithFormat:@"Row %d", indexPath.row];

	[self.detailViewController_iPhone layoutSubViews];
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
	[detailViewController_iPhone release];
	[super dealloc];
}

@end
