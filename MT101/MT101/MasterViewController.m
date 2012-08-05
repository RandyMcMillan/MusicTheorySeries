//
//  MasterViewController.m
//  MT101
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#define MAINLABEL_TAG 1
#define SECONDLABEL_TAG 2
#define PHOTO_TAG 3

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Examples", @"Examples");
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    sectionHeader = [[NSArray alloc]initWithObjects:
                      @"section 1",
                      @"section 2",
                      @"section 3",
                      @"section 4",
                      @"section 5",
                      nil];
       
    videoList = [[NSArray alloc] initWithObjects:
                 @"Aeolian",
                 @"CircleOfFifths",
                 @"SunInClouds",
                 @"UnderWater",
                 @"WindyTrees", 
                 nil];
    
    imageList = [[NSArray alloc] initWithObjects:
                 [UIImage imageNamed:@"Aeolian.png"],
                 [UIImage imageNamed:@"CircleOfFifths.png"],
                 [UIImage imageNamed:@"sunset.png"],
                 [UIImage imageNamed:@"underwater.png"], 
                 [UIImage imageNamed:@"trees.png"],
                 nil];
    
    interactiveList = [[NSArray alloc] initWithObjects:@"aeolianVC",@"circleOfFifthsVC",@"",@"",@"",nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [videoList count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	// The header for the section is the region name -- get this from the region at the section index.
//	Region *region = [regions objectAtIndex:section];

    return [sectionHeader objectAtIndex:section];//sectionHeaders;
    
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 220.0, 15.0)];
    mainLabel.font = [UIFont systemFontOfSize:34.0];
    mainLabel.textAlignment = UITextAlignmentRight;
    mainLabel.textColor = [UIColor blackColor];
    mainLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    mainLabel.tag = MAINLABEL_TAG;

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    };
    
    NSString *mainLabelText;
    mainLabelText = @"test";
    mainLabel.text = mainLabelText;
    [cell.contentView addSubview:mainLabel];


    tableView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.000];
    tableView.separatorColor = [UIColor lightGrayColor];

    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:[videoList objectAtIndex:indexPath.row] ofType:@"png"];
    UIImage *theImage = [UIImage imageWithContentsOfFile:imagePath];
    UIImageView *photo = [[UIImageView alloc] initWithFrame:CGRectMake(225.0, 0.0, 80.0, 45.0)];
    photo.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    photo.tag = PHOTO_TAG;

    photo.image = theImage;
    [cell.contentView addSubview:photo];


    cell.textLabel.text = [videoList objectAtIndex:indexPath.row];
    
    return cell;                      
                           
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.detailViewController.MovieToPlay = [videoList objectAtIndex:indexPath.row];
    //self.detailViewController.imageView.frame = self.detailViewController.view.frame;
    self.detailViewController.imageView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
    self.detailViewController.imageView.image = [imageList objectAtIndex:indexPath.row];
    self.detailViewController.interactiveToDisplay = [interactiveList objectAtIndex:indexPath.row];
    
}

@end
