//
//  DelverViewController.h
//  Newsfeed
//
//  Created by Daniel on 12/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

@interface ViewController : UIViewController <MenuViewDelegate> {
    UIButton            *screenShotButton;
    BOOL                isPushedViewController;
    UIButton            *menuButton;
    BOOL                didDrag;
}

@end
