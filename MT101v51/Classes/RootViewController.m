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

@synthesize detailViewController;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.clearsSelectionOnViewWillAppear	= NO;
	self.contentSizeForViewInPopover		= CGSizeMake(320.0, 600.0);
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CellIdentifier";

	// Dequeue or create a cell of the appropriate type.
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryNone;
	}

    
    
    tableView.backgroundColor =
    [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.000];
    tableView.separatorColor = [UIColor lightGrayColor];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:8.0];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    //    cell.imageView.layer.cornerRadius = 5.0;

    tableView.rowHeight = 150.0;
	// Configure the cell.
	cell.textLabel.text = [NSString stringWithFormat:@"%d RVC", indexPath.row];
    cell.imageView.image = [UIImage originalSizeImageWithPDFNamed:@"StaffIcon.pdf"];
	return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];

	// When a row is selected, set the detail view controller's detail item to the item associated with the selected row.
	detailViewController.detailItem = [NSString stringWithFormat:@"From RootVC Row %d", indexPath.row];
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
	[detailViewController release];
	[super dealloc];
}

@end
