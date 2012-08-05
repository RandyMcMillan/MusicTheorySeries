//
//  DGMenuItemCell.h
//  Newsfeed
//
//  Created by Daniel on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "DGMenuViewItem.h"

@interface DGMenuItemCell : UITableViewCell {
    UILabel             *cellTitleLabel;
    UIImageView         *cellImageView;
    UIImageView         *cellBadgeImageView;
    UILabel             *cellBadgeTitle;
 //   DGMenuViewItem      *subject;
    UIView              *selectedColoredView; // THE SELECTION INDICATOR ON THE RIGHT SIDE
}

@property (nonatomic, retain) NSObject      *subject;
@end
