//
//  MenuViewItem.h
//  Newsfeed
//
//  Created by Daniel on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MenuBlockWrapper;
@interface MenuViewItem : NSObject {
    NSString            *title;
    UIImage             *image;
    UIImage             *selectedImage;
    UIColor             *selectedColor;
    NSInteger           notificationsBadgeCount;

    //Where we expect the item to lead
    NSString            *ttActionPath; // IN CASE YOU USE TT NAVIGATION
    MenuBlockWrapper    *menuBlock; // IN CASE YOU DONT
}

@property (nonatomic, copy) NSString              *title;
@property (nonatomic, retain) UIImage             *image;
@property (nonatomic, retain) UIImage             *selectedImage;
@property (nonatomic, assign) NSInteger           notificationsBadgeCount;
@property (nonatomic, retain) UIColor             *selectedColor;

@property (nonatomic, copy) NSString              *ttActionPath; // IN CASE YOU USE TT NAVIGATION
@property (nonatomic, retain) MenuBlockWrapper    *menuBlock; // IN CASE YOU DONT

- (id)initWithRunBlock:(void (^)(void))block;
- (void)runBlock;


@end
