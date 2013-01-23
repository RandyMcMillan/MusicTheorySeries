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
	    
    [self layoutSubViews];
    
}


-(void)layoutSubViews{


   // Do any additional setup after loading the view from its nib.
    double phi = 1.61803398875;
    int x = 0;
    int y = 0;
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float screenHeight = [UIScreen mainScreen].bounds.size.height;
    float viewWidth = self.view.bounds.size.width;
    float viewHeight = self.view.bounds.size.height;
    //[self.viewA setCenter:self.view.center];
    self.view.autoresizesSubviews = YES;
    if (self.view.bounds.size.width > self.view.bounds.size.height) {//landscape
   
    
       
    
       
    }else{//portrait
    
    
    
    
    }
    
    
    
    
    UIImageView *imageView = [[ UIImageView alloc ] initWithImage:[ UIImage originalSizeImageWithPDFNamed:@"TheGrandStaff.pdf"  ]];

    self.imageViewA.image = imageView.image;
 
    NSLog(@"screenWidth = %f screenHeight = %f",screenWidth,screenHeight);
    NSLog(@"viewWidth = %f viewHeight %f",self.view.bounds.size.width,self.view.bounds.size.height);
    NSLog(@"viewAWidth = %f viewAHeight %f \n\n",self.viewA.bounds.size.width,self.viewA.bounds.size.height);
    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{


    [self layoutSubViews];

}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
