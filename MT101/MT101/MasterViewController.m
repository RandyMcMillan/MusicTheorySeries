//

//  MasterViewController.m
//  MT101
//
//  Created by Randy McMillan on 8/2/12.
//  Copyright (c) 2012 Randy McMillan. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#define MAINLABEL_TAG   1
#define SECONDLABEL_TAG 2
#define PHOTO_TAG       3

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
   nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        self.title = NSLocalizedString(@"Examples", @"Examples");
        self.clearsSelectionOnViewWillAppear    = NO;
        self.contentSizeForViewInPopover        = CGSizeMake(320.0, 600.0);

        //   NSString *version = [[[NSBundle mainBundle] infoDictionary]
        // objectForKey:(NSString*)kCFBundleVersionKey];
        //   NSLog(@"%@",version);
    }

    return self;
} /* initWithNibName */

- (void)viewDidLoad
{
    [super viewDidLoad];

#pragma mark - Section Headers

    NSString *sectionHeadersPath =
        [[NSBundle mainBundle] pathForResource:@"SectionHeaders" ofType:
        @"plist"];
    sectionHeader =
        [[NSArray alloc] initWithContentsOfFile:sectionHeadersPath];

    for (NSString *str in sectionHeader) {
        NSLog(@"sectionHeader = %@", str);
    }

#pragma mark - WikiToDisplay

    NSString *wikiToDisplay0Path =
        [[NSBundle mainBundle] pathForResource:@"WikiToDisplay0" ofType:
        @"plist"];
    wikiToDiplayList0 =
        [[NSArray alloc] initWithContentsOfFile:wikiToDisplay0Path];

    for (NSString *str in wikiToDiplayList0) {
        NSLog(@"wikiToDiplayList0 = %@", str);
    }

    NSString *wikiToDisplay1Path =
        [[NSBundle mainBundle] pathForResource:@"WikiToDisplay1" ofType:
        @"plist"];
    wikiToDiplayList1 =
        [[NSArray alloc] initWithContentsOfFile:wikiToDisplay1Path];

    for (NSString *str in wikiToDiplayList1) {
        NSLog(@"wikiToDiplayList1 = %@", str);
    }

    NSString *wikiToDisplay2Path =
        [[NSBundle mainBundle] pathForResource:@"WikiToDisplay2" ofType:
        @"plist"];
    wikiToDiplayList2 =
        [[NSArray alloc] initWithContentsOfFile:wikiToDisplay2Path];

    for (NSString *str in wikiToDiplayList2) {
        NSLog(@"wikiToDiplayList2 = %@", str);
    }

    NSString *wikiToDisplay3Path =
        [[NSBundle mainBundle] pathForResource:@"WikiToDisplay3" ofType:
        @"plist"];
    wikiToDiplayList3 =
        [[NSArray alloc] initWithContentsOfFile:wikiToDisplay3Path];

    for (NSString *str in wikiToDiplayList3) {
        NSLog(@"wikiToDiplayList3 = %@", str);
    }

    NSString *wikiToDisplay4Path =
        [[NSBundle mainBundle] pathForResource:@"WikiToDisplay4" ofType:
        @"plist"];
    wikiToDiplayList4 =
        [[NSArray alloc] initWithContentsOfFile:wikiToDisplay4Path];

    for (NSString *str in wikiToDiplayList4) {
        NSLog(@"wikiToDiplayList4 = %@", str);
    }

    NSString *wikiToDisplay5Path =
        [[NSBundle mainBundle] pathForResource:@"WikiToDisplay5" ofType:
        @"plist"];
    wikiToDiplayList5 =
        [[NSArray alloc] initWithContentsOfFile:wikiToDisplay5Path];

    for (NSString *str in wikiToDiplayList5) {
        NSLog(@"wikiToDiplayList5 = %@", str);
    }

#pragma mark - Video Lists

    NSString *videoList0Path =
        [[NSBundle mainBundle] pathForResource:@"videoList0" ofType:
        @"plist"];
    videoList0 = [[NSArray alloc] initWithContentsOfFile:videoList0Path];

    for (NSString *str in videoList0) {
        NSLog(@"videoList0 = %@", str);
    }

    NSString *videoList1Path =
        [[NSBundle mainBundle] pathForResource:@"videoList1" ofType:
        @"plist"];
    videoList1 = [[NSArray alloc] initWithContentsOfFile:videoList1Path];

    for (NSString *str in videoList1) {
        NSLog(@"videoList1 = %@", str);
    }

    NSString *videoList2Path =
        [[NSBundle mainBundle] pathForResource:@"videoList2" ofType:
        @"plist"];
    videoList2 = [[NSArray alloc] initWithContentsOfFile:videoList2Path];

    for (NSString *str in videoList2) {
        NSLog(@"videoList2 = %@", str);
    }

    NSString *videoList3Path =
        [[NSBundle mainBundle] pathForResource:@"videoList3" ofType:
        @"plist"];
    videoList3 = [[NSArray alloc] initWithContentsOfFile:videoList3Path];

    for (NSString *str in videoList3) {
        NSLog(@"videoList3 = %@", str);
    }

    NSString *videoList4Path =
        [[NSBundle mainBundle] pathForResource:@"videoList4" ofType:
        @"plist"];
    videoList4 = [[NSArray alloc] initWithContentsOfFile:videoList4Path];

    for (NSString *str in videoList4) {
        NSLog(@"videoList4 = %@", str);
    }

    NSString *videoList5Path =
        [[NSBundle mainBundle] pathForResource:@"videoList5" ofType:
        @"plist"];
    videoList5 = [[NSArray alloc] initWithContentsOfFile:videoList5Path];

    for (NSString *str in videoList5) {
        NSLog(@"videoList5 = %@", str);
    }

#pragma mark - Image Names

    NSString *imageNameList0Path =
        [[NSBundle mainBundle] pathForResource:@"imageNameList0" ofType:
        @"plist"];
    imageNameList0 =
        [[NSArray alloc] initWithContentsOfFile:imageNameList0Path];

    for (NSString *str in imageNameList0) {
        NSLog(@"imageNameList0 = %@", str);
    }

    imageList0 = [[NSArray alloc] initWithObjects: // Staffs CLefs
        [UIImage originalSizeImageWithPDFNamed:[imageNameList0 objectAtIndex:0]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList0 objectAtIndex:1]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList0 objectAtIndex:2]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList0 objectAtIndex:3]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList0 objectAtIndex:4]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList0 objectAtIndex:5]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList0 objectAtIndex:6]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList0 objectAtIndex:7]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList0 objectAtIndex:8]],
        nil];

    NSString *imageNameList1Path =
        [[NSBundle mainBundle] pathForResource:@"imageNameList1" ofType:
        @"plist"];
    imageNameList1 =
        [[NSArray alloc] initWithContentsOfFile:imageNameList1Path];

    for (NSString *str in imageNameList1) {
        NSLog(@"imageNameList1 = %@", str);
    }

    imageList1 = [[NSArray alloc] initWithObjects: //
        [UIImage originalSizeImageWithPDFNamed:[imageNameList1 objectAtIndex:0]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList1 objectAtIndex:1]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList1 objectAtIndex:2]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList1 objectAtIndex:3]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList1 objectAtIndex:4]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList1 objectAtIndex:5]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList1 objectAtIndex:6]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList1 objectAtIndex:7]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList1 objectAtIndex:8]],
        nil];

    
    
    
    NSString *imageNameList2Path =
        [[NSBundle mainBundle] pathForResource:@"imageNameList2" ofType:
        @"plist"];
    imageNameList2 =
        [[NSArray alloc] initWithContentsOfFile:imageNameList2Path];

    for (NSString *str in imageNameList2) {
        NSLog(@"imageNameList2 = %@", str);
    }

    imageList2 = [[NSArray alloc] initWithObjects: // Modes
        [UIImage originalSizeImageWithPDFNamed:[imageNameList2 objectAtIndex:0]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList2 objectAtIndex:1]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList2 objectAtIndex:2]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList2 objectAtIndex:3]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList2 objectAtIndex:4]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList2 objectAtIndex:5]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList2 objectAtIndex:6]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList2 objectAtIndex:7]],
        [UIImage originalSizeImageWithPDFNamed:[imageNameList2 objectAtIndex:8]],
        nil];
    
    
    NSString *imageNameList3Path =
    [[NSBundle mainBundle] pathForResource:@"imageNameList3" ofType:
     @"plist"];
    imageNameList3 =
    [[NSArray alloc] initWithContentsOfFile:imageNameList3Path];
    
    for (NSString *str in imageNameList3) {
        NSLog(@"imageNameList2 = %@", str);
    }
    
    imageList3 = [[NSArray alloc] initWithObjects: // Modes
                  [UIImage originalSizeImageWithPDFNamed:[imageNameList3 objectAtIndex:0]],
                  [UIImage originalSizeImageWithPDFNamed:[imageNameList3 objectAtIndex:1]],
                  [UIImage originalSizeImageWithPDFNamed:[imageNameList3 objectAtIndex:2]],
                  nil];

    

    
    
    NSString *imageNameList4Path =
        [[NSBundle mainBundle] pathForResource:@"imageNameList4" ofType:
        @"plist"];
    imageNameList4 =
        [[NSArray alloc] initWithContentsOfFile:imageNameList4Path];

    for (NSString *str in imageNameList4) {
        NSLog(@"imageNameList4 = %@", str);
    }

    imageList4 = [[NSArray alloc] initWithObjects: // Staffs CLefs
        [UIImage imageNamed:[imageNameList4 objectAtIndex:0]],
        [UIImage imageNamed:[imageNameList4 objectAtIndex:1]],
        [UIImage imageNamed:[imageNameList4 objectAtIndex:2]],
        [UIImage imageNamed:[imageNameList4 objectAtIndex:3]],
        [UIImage imageNamed:[imageNameList4 objectAtIndex:4]],
        [UIImage imageNamed:[imageNameList4 objectAtIndex:5]],
        [UIImage imageNamed:[imageNameList4 objectAtIndex:6]],
        [UIImage imageNamed:[imageNameList4 objectAtIndex:7]],
        [UIImage imageNamed:[imageNameList4 objectAtIndex:8]],
        nil];

    NSString *imageNameList5Path =
        [[NSBundle mainBundle] pathForResource:@"imageNameList5" ofType:
        @"plist"];
    imageNameList5 =
        [[NSArray alloc] initWithContentsOfFile:imageNameList5Path];

    for (NSString *str in imageNameList5) {
        NSLog(@"imageNameList5 = %@", str);
    }

    imageList5 = [[NSArray alloc] initWithObjects: // Staffs CLefs
        [UIImage imageNamed:[imageNameList5 objectAtIndex:0]],
        [UIImage imageNamed:[imageNameList5 objectAtIndex:1]],
        [UIImage imageNamed:[imageNameList5 objectAtIndex:2]],
        [UIImage imageNamed:[imageNameList5 objectAtIndex:3]],
        [UIImage imageNamed:[imageNameList5 objectAtIndex:4]],
        [UIImage imageNamed:[imageNameList5 objectAtIndex:5]],
        [UIImage imageNamed:[imageNameList5 objectAtIndex:6]],
        [UIImage imageNamed:[imageNameList5 objectAtIndex:7]],
        [UIImage imageNamed:[imageNameList5 objectAtIndex:8]],
        nil];

#pragma mark - Interactive Lists

    interactiveList0 = [[NSArray alloc] initWithObjects:
        @"GrandStaffViewController",
        @"TrebleClefViewController",
        @"SopranoClefViewController",
        @"MezzoSopranoClefViewController",
        @"AltoClefViewController",
        @"TenorClefViewController",
        @"BariToneClefViewController",
        @"BassClefViewController",
        @"SubBassClefViewController",
        nil];

    interactiveList1 = [[NSArray alloc] initWithObjects:
        @"CircleOfFifthsViewController",
        @"ChromaticCircleViewController",
        nil];

    interactiveList2 = [[NSArray alloc] initWithObjects: // modes
        @"IonianViewController",
        @"DorianViewController",
        @"PhrygianViewController",
        @"LydianViewController",
        @"MixoLydianViewController",
        @"AeolianViewController",
        @"LocrianViewController",
        @"LocrianViewController",
        @"LocrianViewController",
        @"LocrianViewController",
        @"LocrianViewController",
        @"",
        nil];

    interactiveList3 = [[NSArray alloc] initWithObjects:    // Solfege
                                                            // Naturals
                                                            // Sharps Flats
        @"SolfegeNaturalsViewController",
        @"SolfegeSharpsViewController",
        @"SolfegeFlatsViewController",
        @"AeolianViewController",
        @"AeolianViewController",
        @"AeolianViewController",
        @"AeolianViewController",
        @"AeolianViewController",
        @"AeolianViewController",
        nil];

    interactiveList4 = [[NSArray alloc] initWithObjects:
        @"AeolianViewController",
        @"CircleOfFifthsViewController",
        @"CircleOfFifthsViewController",
        @"circleOfFifthsVC",
        @"circleOfFifthsVC",
        @"circleOfFifthsVC",
        @"circleOfFifthsVC",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        nil];

    interactiveList5 = [[NSArray alloc] initWithObjects:
        @"AeolianViewController",
        @"CircleOfFifthsViewController",
        @"circleOfFifthsVC",
        @"circleOfFifthsVC",
        @"circleOfFifthsVC",
        @"circleOfFifthsVC",
        @"circleOfFifthsVC",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        nil];
} /* viewDidLoad */

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
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
        return NO;
    }
    
    if (toInterfaceOrientation ==
        UIInterfaceOrientationPortraitUpsideDown) {
        return NO;
    } else {return NO; }
} /* shouldAutorotateToInterfaceOrientation */


- (BOOL)didAutorotateToInterfaceOrientation:(UIInterfaceOrientation)
   currentInterfaceOrientation
{
    NSLog(@"did auto rotate");
    return YES;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //    return 5;
    return [sectionHeader count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(
    NSInteger)section
{
    if (section == 0) {
        return [videoList0 count];
    }

    if (section == 1) {
        return [videoList1 count];
    }

    if (section == 2) {
        return [videoList2 count];
    }

    if (section == 3) {
        return [videoList3 count];
    }

    if (section == 4) {
        return [videoList4 count];
    }

    if (section == 5) {
        return [videoList5 count];
    } else {}

    return 0;
} /* tableView */

- (NSString *)  tableView               :(UITableView *)tableView
                titleForHeaderInSection :(NSInteger)section
{
    // The header for the section is the region name -- get this from the
    // region at the section index.
    //	Region *region = [regions objectAtIndex:section];

    return [sectionHeader objectAtIndex:section]; // sectionHeaders;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)   tableView               :(UITableView *)tableView
                        cellForRowAtIndexPath   :(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    /*
     *   UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 220.0, 15.0)];
     *   mainLabel.font = [UIFont systemFontOfSize:34.0];
     *   mainLabel.textAlignment = UITextAlignmentRight;
     *   mainLabel.textColor = [UIColor blackColor];
     *   mainLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
     *   mainLabel.tag = MAINLABEL_TAG;
     */

    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell =
            [[UITableViewCell alloc]    initWithStyle   :
            UITableViewCellStyleDefault
                                        reuseIdentifier :CellIdentifier];
    }

    //   NSString *mainLabelText;
    //  mainLabelText = @"test";
    //  mainLabel.text = mainLabelText;
    //  [cell.contentView addSubview:mainLabel];

    tableView.backgroundColor =
        [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.000];
    tableView.separatorColor = [UIColor lightGrayColor];

    //  NSString *imagePath = [[NSBundle mainBundle]
    // pathForResource:[videoList1 objectAtIndex:indexPath.row]
    // ofType:@"png"];
    //  UIImage *theImage = [UIImage imageWithContentsOfFile:imagePath];
    //  UIImageView *photo = [[UIImageView alloc]
    // initWithFrame:CGRectMake(225.0, 0.0, 80.0, 45.0)];
    //  photo.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
    // UIViewAutoresizingFlexibleHeight;
    //  photo.tag = PHOTO_TAG;

    // photo.image = theImage;
    //    [cell.contentView addSubview:photo];

    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:18.0];

    //   cell.textLabel.shadowColor = [UIColor whiteColor];
    // cell.textLabel.shadowOffset = CGSizeMake(1, 1);
    cell.textLabel.backgroundColor = [UIColor clearColor];

    if (indexPath.section == 0) {
        //
        cell.textLabel.text = [videoList0 objectAtIndex:indexPath.row];
    }

    if (indexPath.section == 1) {
        //
        cell.textLabel.text = [videoList1 objectAtIndex:indexPath.row];
    }

    if (indexPath.section == 2) {
        //
        cell.textLabel.text = [videoList2 objectAtIndex:indexPath.row];
    }

    if (indexPath.section == 3) {
        //
        cell.textLabel.text = [videoList3 objectAtIndex:indexPath.row];
    }

    if (indexPath.section == 4) {
        //
        cell.textLabel.text = [videoList4 objectAtIndex:indexPath.row];
    }

    if (indexPath.section == 5) {
        //
        cell.textLabel.text = [videoList5 objectAtIndex:indexPath.row];
    }

    if (indexPath.section == 6) {
        //
        //        cell.textLabel.text = [videoList6
        // objectAtIndex:indexPath.row];
    }

    if (indexPath.section == 7) {
        //
        //      cell.textLabel.text = [videoList7
        // objectAtIndex:indexPath.row];
    }

    return cell;
} /* tableView */

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(
    NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(
    NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //

        self.detailViewController.MovieToPlay =
            [videoList0 objectAtIndex:indexPath.row];
        self.detailViewController.imageView.image =
            [imageList0 objectAtIndex:indexPath.row];
        self.detailViewController.interactiveToDisplay =
            [interactiveList0 objectAtIndex:indexPath.row];
        self.detailViewController.wikiToDisplay =
            [wikiToDiplayList0 objectAtIndex:indexPath.row];
        [self.detailViewController.imageView useGrandStaffStyle];
    }

    if (indexPath.section == 1) {
        //

        self.detailViewController.MovieToPlay =
            [videoList1 objectAtIndex:indexPath.row];
        self.detailViewController.imageView.image =
            [imageList1 objectAtIndex:indexPath.row];
        self.detailViewController.interactiveToDisplay =
            [interactiveList1 objectAtIndex:indexPath.row];
        self.detailViewController.wikiToDisplay =
            [wikiToDiplayList1 objectAtIndex:indexPath.row];
        [self.detailViewController.imageView useCircleStyle];
    }

    if (indexPath.section == 2) {
        //

        self.detailViewController.MovieToPlay =
            [videoList2 objectAtIndex:indexPath.row];
        self.detailViewController.imageView.image =
            [imageList2 objectAtIndex:indexPath.row];
        self.detailViewController.interactiveToDisplay =
            [interactiveList2 objectAtIndex:indexPath.row];
        self.detailViewController.wikiToDisplay =
            [wikiToDiplayList2 objectAtIndex:indexPath.row];
        [self.detailViewController.imageView useGrandStaffStyle];
    }

    if (indexPath.section == 3) {
        //

        self.detailViewController.MovieToPlay =
            [videoList3 objectAtIndex:indexPath.row];
        self.detailViewController.imageView.image =
            [imageList3 objectAtIndex:indexPath.row];
        self.detailViewController.interactiveToDisplay =
            [interactiveList3 objectAtIndex:indexPath.row];
        self.detailViewController.wikiToDisplay =
        [wikiToDiplayList3 objectAtIndex:indexPath.row];
        [self.detailViewController.imageView useGrandStaffStyle];
    }

    if (indexPath.section == 4) {
        //

        self.detailViewController.MovieToPlay =
            [videoList4 objectAtIndex:indexPath.row];
        self.detailViewController.imageView.autoresizingMask =
            (UIViewAutoresizingFlexibleWidth |
            UIViewAutoresizingFlexibleHeight |
            UIViewAutoresizingFlexibleLeftMargin |
            UIViewAutoresizingFlexibleRightMargin);
        self.detailViewController.imageView.image =
            [imageList4 objectAtIndex:indexPath.row];
        self.detailViewController.interactiveToDisplay =
            [interactiveList4 objectAtIndex:indexPath.row];
        [self.detailViewController.imageView useGrandStaffStyle];
    }

    if (indexPath.section == 5) {
        //

        self.detailViewController.MovieToPlay =
            [videoList5 objectAtIndex:indexPath.row];
        self.detailViewController.imageView.autoresizingMask =
            (UIViewAutoresizingFlexibleWidth |
            UIViewAutoresizingFlexibleHeight |
            UIViewAutoresizingFlexibleLeftMargin |
            UIViewAutoresizingFlexibleRightMargin);
        self.detailViewController.imageView.image =
            [imageList5 objectAtIndex:indexPath.row];
        self.detailViewController.interactiveToDisplay =
            [interactiveList5 objectAtIndex:indexPath.row];
        [self.detailViewController.imageView useGrandStaffStyle];
    }

    if (indexPath.section == 6) {}

    if (indexPath.section == 7) {}

    self.detailViewController.toolBar.alpha = 1.0;
    self.detailViewController.title         =
        self.detailViewController.MovieToPlay;
    self.detailViewController.detailDescriptionLabel.text   = nil;
    self.detailViewController.musicTheory101Label.text      = nil;
    self.detailViewController.vLabel.text = nil;
    
    //        self.window.rootViewController = masterNavigationController;

#define IS_IPAD	(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    if  (IS_IPAD){}else{
    [self.navigationController pushViewController:self.detailViewController animated:YES];
    }
    
} /* tableView */

@end
