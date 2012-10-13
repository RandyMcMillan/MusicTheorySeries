//
//  MGSplitCornersView.h
//  MT101v5.1
//
//  Created by Matt Gemmell on 28/07/2010.
//  Copyright 2010 Instinctive Code.
//

#import <UIKit/UIKit.h>

typedef enum _MGCornersPosition {
	MGCornersPositionLeadingVertical	= 0, // top of screen for a left/right split.
	MGCornersPositionTrailingVertical	= 1, // bottom of screen for a left/right split.
	MGCornersPositionLeadingHorizontal	= 2, // left of screen for a top/bottom split.
	MGCornersPositionTrailingHorizontal	= 3  // right of screen for a top/bottom split.
} MGCornersPosition;

@class MT101v5.1Controller;
@interface MGSplitCornersView : UIView {
	float cornerRadius;
	MT101v5.1Controller *splitViewController;
	MGCornersPosition cornersPosition;
	UIColor *cornerBackgroundColor;
}

@property (nonatomic, assign) float cornerRadius;
@property (nonatomic, assign) MT101v5.1Controller *splitViewController; // weak ref.
@property (nonatomic, assign) MGCornersPosition cornersPosition; // don't change this manually; let the splitViewController manage it.
@property (nonatomic, retain) UIColor *cornerBackgroundColor;

@end
