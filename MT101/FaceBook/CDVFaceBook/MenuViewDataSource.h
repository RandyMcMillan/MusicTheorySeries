//
//  MenuViewDataSource.h
//  Newsfeed
//
//  Created by Daniel on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuViewItem.h"

@class MenuView;

@protocol ScrollViewProtocol <NSObject>
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView;
@end

@interface MenuViewDataSource : NSObject <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray          *dataSourceArray;
    
    id<ScrollViewProtocol>  delegate;
    
    MenuViewItem          *recentActivityItem;
    MenuViewItem          *shopinItem;
    MenuViewItem          *sywrItem;
    MenuViewItem          *profileItem;
    MenuViewItem          *chatItem;
    MenuViewItem          *cartItem;
    MenuViewItem          *catalogsItem;
    MenuViewItem          *notificationsItem;
    
    MenuViewItem          *termsItem;

    NSIndexPath             *selectedIndexPath;
}

@property (nonatomic, retain) NSMutableArray          *dataSourceArray;
@property (nonatomic, assign) id<ScrollViewProtocol>  delegate;
@property (nonatomic, assign) MenuViewItem          *recentActivityItem;
@property (nonatomic, assign) MenuViewItem          *shopinItem;
@property (nonatomic, assign) MenuViewItem          *sywrItem;
@property (nonatomic, assign) MenuViewItem          *profileItem;
@property (nonatomic, assign) MenuViewItem          *chatItem;
@property (nonatomic, assign) MenuViewItem          *cartItem;
@property (nonatomic, assign) MenuViewItem          *catalogsItem;
@property (nonatomic, assign) MenuViewItem          *notificationsItem;

@property (nonatomic, assign) MenuViewItem          *termsItem;

@property (nonatomic, retain) NSIndexPath             *selectedIndexPath;

+ (MenuViewDataSource *)sharedMenuDataSource;

- (void)tableViewDidAppear:(UITableView *)tableView;

@end
