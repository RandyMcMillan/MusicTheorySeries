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
@synthesize viewA,viewB,imageViewA,imageViewB;

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
	// Do any additional setup after loading the view from its nib.
    double phi = 1.61803398875;
    int x = 0;
    int y = 0;
    //ref view width only for split division
    //
    //self.phi = doublePhi;
    
    /*
     
     
     
     
     */
    
    //[self.view bringSubviewToFront:viewA];
    [self.viewA setBounds:CGRectMake(0,
                                     0,
                                     self.view.bounds.size.width/phi,
                                     self.view.bounds.size.height/phi)];
    
    
    [self.viewB setBounds:CGRectMake(x,
                                     y,
                                     200,
                                     200)];
 
    
    [self.imageViewA setBounds:CGRectMake(0,
                                          0,
                                          0,
                                          0)];
    
    [self.imageViewB setBounds:CGRectMake(0,
                                          0,
                                          0,
                                          0)];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
