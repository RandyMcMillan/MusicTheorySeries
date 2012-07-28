//
//  MenuView.m
//  Newsfeed
//
//  Created by Daniel on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuView.h"

#define IS_IPAD        (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define TOTAL_WIDTH     320
#define MENU_WIDTH      280
#define MENU_HEIGHT     1024
#define SCAN_BUTTON_WIDTH 53
#define SCAN_BUTTON_HEIGHT 29
#define NAV_BAR_HEIGHT  44
#define SHADOW_WIDTH    14

@interface MenuView ()
- (void)initMenuFunctionality;

- (void)didStartShowingAnimation;
- (void)didStartHidingAnimation;
- (void)didPushViewController;
@end

@implementation MenuView
@synthesize menuView;
@synthesize navBar;
@synthesize searchBar;
@synthesize searchBarButton;
@synthesize scrollView;
@synthesize tableView;
@synthesize delegate;
@synthesize parentViewController;
@synthesize toolBar;

static MenuView *sharedInstance = nil;

- (id)initWithFrame:(CGRect)frame {
        self = [super initWithFrame:frame];
        if (self) {
                self.backgroundColor = [UIColor clearColor];

                self.menuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MENU_WIDTH, MENU_HEIGHT)];
                [self addSubview:menuView];
                [menuView release];
//                menuView.alpha = 0.5;
                [self initMenuFunctionality];
        }
        return self;
}


- (void)initMenuFunctionality {
    
    NSLog(@"initMenuFunctionality\ninitMenuFunctionality\ninitMenuFunctionality\ninitMenuFunctionality\ninitMenuFunctionality");
//        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, MENU_WIDTH - SCAN_BUTTON_WIDTH + 3, NAV_BAR_HEIGHT)];
  //      searchBar.delegate = self;
    //    searchBar.tintColor = [UIColor redColor];
      //  [menuView addSubview:searchBar];
        //[menuView bringSubviewToFront:searchBar];

   
    NSString* systemVersion = [[UIDevice currentDevice] systemVersion];
	BOOL isLessThaniOS4 = ([systemVersion compare:@"4.0" options:NSNumericSearch] == NSOrderedAscending);
	BOOL isGreaterThaniOS4 = ([systemVersion compare:@"4.0" options:NSNumericSearch] == NSOrderedDescending);
	BOOL isLessThaniOS5 = ([systemVersion compare:@"5.0" options:NSNumericSearch] == NSOrderedAscending);
	BOOL isGreaterThaniOS5 = ([systemVersion compare:@"5.0" options:NSNumericSearch] == NSOrderedDescending);
    
	if (isLessThaniOS4 && isLessThaniOS5)
	{
		//NSLog(@"isLessThaniOS4 && isLessThaniOS5 = %@",whatever);
	}
    
	if ( isGreaterThaniOS4 && isLessThaniOS5)
	{
		//NSLog(@"isGreaterThaniOS4 && isLessThaniOS5 =  %@",whatever);
	}
    
	if (isGreaterThaniOS5)
	{
        
		//NSLog(@"isGreaterThaniOS5 =  %@",whatever);
	}
    
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, MENU_WIDTH, NAV_BAR_HEIGHT)];
    toolBar.tintColor = [UIColor colorWithRed:0.173 green:0.196 blue:0.243 alpha:1.000];
  /* 
    if ([toolBar respondsToSelector:@selector(setBackgroundImage:forToolbarPosition:barMetrics:)]) {
        [toolBar setBackgroundImage:[UIImage imageNamed:@"toolbarBackground"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    } else {
        [toolBar insertSubview:[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"toolbarBackground"]] autorelease] atIndex:0];
    }
    */
    
    toolBar.barStyle = 0;
    [menuView addSubview:toolBar];
    [menuView bringSubviewToFront:toolBar];

//        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MENU_WIDTH, MENU_HEIGHT)];
        scrollView.contentSize = CGSizeMake(MENU_WIDTH, 1150);
        scrollView.contentOffset = CGPointMake(0, 100);

        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200, MENU_WIDTH, 1150)];
        backgroundImageView.backgroundColor = [UIColor colorWithRed:0.192 green:0.216 blue:0.271 alpha:1.000];
        //[UIColor greenColor]; // SET BACKGROUND IMAGE HERE TO HAVE CUSTOM SCROLLABLE IMAGE
        [scrollView addSubview:backgroundImageView];
        [backgroundImageView release];

        [menuView addSubview:scrollView];

        [MenuViewDataSource sharedMenuDataSource].delegate = self;

        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAV_BAR_HEIGHT, MENU_WIDTH, MENU_HEIGHT - NAV_BAR_HEIGHT) style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor colorWithRed:0.180 green:0.204 blue:0.259 alpha:1.000]; //[UIColor redColor];//[UIColor clearColor];
        tableView.dataSource = [MenuViewDataSource sharedMenuDataSource];
        tableView.delegate = [MenuViewDataSource sharedMenuDataSource];
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        //tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.separatorColor = [UIColor colorWithRed:0.106 green:0.122 blue:0.161 alpha:1.000]; //[UIColor lightGrayColor];
        [menuView addSubview:tableView];
        [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
        [scrollView scrollRectToVisible:CGRectMake(aScrollView.contentOffset.x, aScrollView.contentOffset.y+100, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
}

//////////////////////////////////////SINGLETON IMPLEMENTATION///////////////////////////////////////////////////

+ (MenuView *)sharedMenuView {
        @synchronized (self) {
                if (sharedInstance == nil) {
                        sharedInstance = [[self alloc] initWithFrame:CGRectMake(-MENU_WIDTH, 20, MENU_WIDTH, MENU_HEIGHT)];
                }
        }

        return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
        @synchronized(self) {
                if (sharedInstance == nil) {
                        sharedInstance = [super allocWithZone:zone];
                        return sharedInstance;
                }
        }

        return nil;
}

- (id)copyWithZone:(NSZone *)zone {
        return self;
}

- (id)retain {
        return self;
}

- (oneway void)release {
}

- (id)autorelease {
        return self;
}

- (NSUInteger)retainCount {
        return NSUIntegerMax;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)showMenu {
        [self didStartShowingAnimation];
        [UIView beginAnimations:@"ShowMenu" context:nil];
        [UIView setAnimationDuration:0.3];
        self.frame = CGRectMake(0, 20, TOTAL_WIDTH, MENU_HEIGHT);
        [UIView commitAnimations];
}

- (void)hideMenu {
        [self didStartHidingAnimation];
        [UIView beginAnimations:@"HideMenu" context:nil];
        [UIView setAnimationDuration:0.3];
        self.frame = CGRectMake(-MENU_WIDTH, 20, MENU_WIDTH, MENU_HEIGHT);
        [UIView commitAnimations];
        [searchBar resignFirstResponder];
}

- (void)didStartShowingAnimation {
        [[MenuViewDataSource sharedMenuDataSource] tableViewDidAppear:tableView];
        if (delegate && [delegate respondsToSelector:@selector(menuViewDidStartShowingAnimation:)]) {
                [delegate menuViewDidStartShowingAnimation:self];
        }
}

- (void)didStartHidingAnimation {
        if (delegate && [delegate respondsToSelector:@selector(menuViewDidStartHidingAnimation:)]) {
                [delegate menuViewDidStartHidingAnimation:self];
        }
}

- (void)didPushViewController {
        if (delegate && [delegate respondsToSelector:@selector(didPushViewController)]) {
                [delegate didPushViewController];
        }
}


//ACTIONS
- (void)searchBarTextDidBeginEditing:(UISearchBar *)aSearchBar {
        [searchBar resignFirstResponder];
        self.frame = CGRectMake(-MENU_WIDTH, 20, MENU_WIDTH, MENU_HEIGHT);
        if ([delegate respondsToSelector:@selector(didSelectSearchBar)]) {
                [delegate didSelectSearchBar];
        }
}

- (void)searchBarButtonPressed:(id)sender {
        self.frame = CGRectMake(-MENU_WIDTH, 20, MENU_WIDTH, MENU_HEIGHT);
        if ([delegate respondsToSelector:@selector(didSelectSearchBar)]) {
                [delegate didSelectSearchBar];
        }
}


@end
