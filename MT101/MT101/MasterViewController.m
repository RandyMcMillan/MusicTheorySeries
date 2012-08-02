//
//  MasterViewController.m
//  MT101
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [videoList count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }


    tableView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.000];
    tableView.separatorColor = [UIColor lightGrayColor];


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
