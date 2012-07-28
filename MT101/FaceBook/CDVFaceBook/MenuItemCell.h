//
//  DGMenuItemCell.h
//  Newsfeed
//
//  Created by Daniel on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewItem.h"

@interface MenuItemCell : UITableViewCell {
    UILabel             *cellTitleLabel;
    UIImageView         *cellImageView;
    UIImageView         *cellBadgeImageView;
    UILabel             *cellBadgeTitle;
    MenuViewItem      *subject;
    UIView              *selectedColoredView; // THE SELECTION INDICATOR ON THE RIGHT SIDE
}

@property (nonatomic, retain) MenuViewItem      *subject;
@end
