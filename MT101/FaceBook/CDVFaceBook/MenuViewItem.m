//
//  MenuViewItem.m
//  Newsfeed
//
//  Created by Daniel on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuViewItem.h"

typedef void (^OpenFromMenuBlock)(void);

@interface MenuBlockWrapper : NSObject {
        OpenFromMenuBlock actionBlock;
}
@property (nonatomic, copy) OpenFromMenuBlock actionBlock;
@end

@implementation MenuBlockWrapper

@synthesize actionBlock;

- (void)dealloc {
        [actionBlock release];
        [super dealloc];
}

@end

@implementation MenuViewItem
@synthesize title;
@synthesize image;
@synthesize selectedImage;
@synthesize notificationsBadgeCount;
@synthesize ttActionPath;
@synthesize menuBlock;
@synthesize selectedColor;

- (id)initWithRunBlock:(void (^)(void))block {
        self = [super init];
        if (self) {
                self.menuBlock = [[MenuBlockWrapper alloc] init];
                menuBlock.actionBlock = block;
        }
        return self;
}

- (void)runBlock {
        menuBlock.actionBlock();
}

- (void)dealloc {
        self.title = nil;
        self.image = nil;
        self.selectedImage = nil;
        self.ttActionPath = nil;
        self.menuBlock = nil;
        self.selectedColor = nil;
        [super dealloc];
}

@end
