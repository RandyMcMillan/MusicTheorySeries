//
//  DGMenuView.h
//  Newsfeed
//
//  Created by Daniel on 12/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewDataSource.h"

@protocol MenuViewDelegate <NSObject>

@optional
- (void)menuViewDidStartShowingAnimation:(UIView *)menuView;
- (void)menuViewDidStopShowingAnimation:(UIView *)menuView;
- (void)menuViewDidStartHidingAnimation:(UIView *)menuView;
- (void)menuViewDidStopHidingAnimation:(UIView *)menuView;
- (void)didPushViewController;
- (void)didSelectSearchBar;
- (void)shouldOpenViewController:(UIViewController *)vc;
@end

@interface MenuView : UIView <UISearchBarDelegate, ScrollViewProtocol> {
    UIView               *menuView;
        
    UINavigationBar      *navBar;
    UISearchBar          *searchBar;
    UIButton             *searchBarButton; // TEMPORARY
    UIScrollView         *scrollView;
    UITableView          *tableView;
    id<MenuViewDelegate> delegate;
    UIViewController     *parentViewController; //TEMPORARY
    
    UIToolbar           *toolBar;
}


@property (nonatomic, retain) UIView               *menuView;

@property (nonatomic, retain) UINavigationBar      *navBar;
@property (nonatomic, retain) UISearchBar          *searchBar;
@property (nonatomic, retain) UIButton             *searchBarButton; // TEMPORARY
@property (nonatomic, retain) UIScrollView         *scrollView;
@property (nonatomic, retain) UITableView          *tableView;
@property (nonatomic, assign) id<MenuViewDelegate> delegate;
@property (nonatomic, assign) UIViewController     *parentViewController;
@property (nonatomic, retain) UIToolbar             *toolBar;
+ (MenuView *)sharedMenuView;

- (void)showMenu;
- (void)hideMenu;

@end

