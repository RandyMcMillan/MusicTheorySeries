//
//  MenuViewDataSource.m
//  Newsfeed
//
//  Created by Daniel on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuViewDataSource.h"
#import "MenuItemCell.h"
#import "MenuView.h"
//#import "Three20/Three20.h"

@class MenuView;
@class MenuBlockWrapper;

@implementation MenuViewDataSource
@synthesize dataSourceArray;
@synthesize delegate;
@synthesize recentActivityItem;
@synthesize shopinItem;
@synthesize sywrItem;
@synthesize profileItem;
@synthesize chatItem;
@synthesize cartItem;
@synthesize catalogsItem;
@synthesize notificationsItem;

@synthesize termsItem;

@synthesize selectedIndexPath;

static MenuViewDataSource *sharedInstance = nil;

- (id)init {
        self = [super init];
        if (self) {
                //MENU OBJECTS GO HERE
                self.dataSourceArray = [[NSMutableArray alloc] init];
                //
                self.recentActivityItem = [[MenuViewItem alloc] initWithRunBlock:^(void) {

                                                   NSLog (@"self.dataSourceArray > self.recentActivityItem");

                                                   NSLog (@" keyWindow = %@",[[UIApplication sharedApplication] keyWindow]);

                                                   //[[[[UIAlertView alloc] initWithTitle:@"First" message:@"Hi" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease] show];

                                           }];

                recentActivityItem.title = @"First Item";
                recentActivityItem.selectedColor = [UIColor colorWithRed:74/255.0 green:142/255.0 blue:194/255.0 alpha:1];
                [dataSourceArray addObject:recentActivityItem];
                [recentActivityItem release];

                self.shopinItem = [[MenuViewItem alloc] initWithRunBlock:^(void) {
                                           [[[[UIAlertView alloc] initWithTitle:@"Second" message:@"Hi" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease] show];
                                   }];
                shopinItem.title = @"Second";
                shopinItem.selectedColor = [UIColor colorWithRed:246/255.0 green:190/255.0 blue:15/255.0 alpha:1];
                [dataSourceArray addObject:shopinItem];
                [shopinItem release];

                self.profileItem = [[MenuViewItem alloc] initWithRunBlock:^(void) {
                                            [[[[UIAlertView alloc] initWithTitle:@"Third" message:@"Hi" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease] show];
                                    }];
                profileItem.title = @"Third";
                profileItem.selectedColor = [UIColor colorWithRed:38/255.0 green:155/255.0 blue:204/255.0 alpha:1];
                [dataSourceArray addObject:profileItem];
                [profileItem release];

                self.cartItem = [[MenuViewItem alloc] initWithRunBlock:^(void) {
                                         [[[[UIAlertView alloc] initWithTitle:@"Forth" message:@"Hi" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease] show];
                                 }];
                cartItem.title = @"Forth";
                cartItem.selectedColor = [UIColor colorWithRed:211/255.0 green:80/255.0 blue:2/255.0 alpha:1];
                [dataSourceArray addObject:cartItem];
                [cartItem release];

                self.catalogsItem = [[MenuViewItem alloc] initWithRunBlock:^(void) {
                                             [[[[UIAlertView alloc] initWithTitle:@"Fifth" message:@"Hi" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease] show];
                                     }];
                catalogsItem.title = @"Fifth";
                catalogsItem.selectedColor = [UIColor colorWithRed:32/255.0 green:88/255.0 blue:136/255.0 alpha:1];
                [dataSourceArray addObject:catalogsItem];
                [catalogsItem release];

                self.notificationsItem = [[MenuViewItem alloc] initWithRunBlock:^(void) {
                                                  [[[[UIAlertView alloc] initWithTitle:@"Sixth" message:@"Hi" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease] show];
                                          }];
                notificationsItem.title = @"Sixth";
                notificationsItem.selectedColor = [UIColor colorWithRed:178/255.0 green:13/255.0 blue:13/255.0 alpha:1];
                [dataSourceArray addObject:notificationsItem];
                [notificationsItem release];
        }

        return self;
}

//////////////////////////////////////SINGLETON IMPLEMENTATION///////////////////////////////////////////////////

+ (MenuViewDataSource *)sharedMenuDataSource {
        @synchronized (self) {
                if (sharedInstance == nil) {
                        sharedInstance = [[self alloc] init];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [dataSourceArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
        return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 25)];
        bgView.backgroundColor = [UIColor colorWithRed:0.408 green:0.435 blue:0.494 alpha:1.000]; //[UIColor clearColor];

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 25)];
        titleLabel.backgroundColor = [UIColor colorWithRed:0.212 green:0.243 blue:0.306 alpha:1.000]; //[UIColor colorWithRed:0.251 green:0.286 blue:0.365 alpha:1.000];//[UIColor colorWithRed:0.184 green:0.212 blue:0.271 alpha:1.000];//[UIColor colorWithRed:0.137 green:0.153 blue:0.196 alpha:1.000];//[UIColor clearColor];
        titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0];
        titleLabel.textColor = [UIColor colorWithRed:0.408 green:0.435 blue:0.494 alpha:1.000]; //[UIColor lightGrayColor];
        titleLabel.shadowColor = [UIColor colorWithRed:0.129 green:0.141 blue:0.165 alpha:1.000]; //[UIColor colorWithRed:0.169 green:0.188 blue:0.235 alpha:1.000]; //[UIColor whiteColor];
        titleLabel.shadowOffset = CGSizeMake(0.45, 0.45);

        NSString *headerString = [[NSString alloc] init];
        headerString = @"SECTION HEADER";
        NSString *headerStringWithFormat = [NSString stringWithFormat:@"    %@", headerString]; //add space to string so it is not all the way to left of menu

        titleLabel.text = headerStringWithFormat;

        [bgView addSubview:titleLabel];
        [titleLabel release];

        return [bgView autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        static NSString *CellIdentifier = @"MenuItemCell";
        MenuItemCell *cell = (MenuItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
                cell = [[[MenuItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }

        cell.subject = [dataSourceArray objectAtIndex:indexPath.row];
        return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [[MenuView sharedMenuView] hideMenu];
        self.selectedIndexPath = indexPath;
        MenuViewItem *menuItem = (MenuViewItem *)[dataSourceArray objectAtIndex:indexPath.row];
        [menuItem runBlock];
}

- (void)tableViewDidAppear:(UITableView *)tableView {
        //    NSLog(@"Set the actions you want to have when tableView is loaded, such as badge numbers, API calls, etc...");

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
        if ([delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
                [delegate scrollViewDidScroll:scrollView];
        }
}

- (void)dealloc {
        self.dataSourceArray = nil;
        [super dealloc];
}

@end
