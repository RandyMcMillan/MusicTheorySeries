//
//  MGSplitDividerView.h
//  MT101
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright 2010 Instinctive Code.
//

#import <UIKit/UIKit.h>

@class MT101Controller;
@interface MGSplitDividerView : UIView {
	MT101Controller *splitViewController;
	BOOL allowsDragging;
}

@property (nonatomic, assign) MT101Controller *splitViewController; // weak ref.
@property (nonatomic, assign) BOOL allowsDragging;

- (void)drawGripThumbInRect:(CGRect)rect;

@end
