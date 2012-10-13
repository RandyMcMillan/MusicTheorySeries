//
//  MGSplitDividerView.h
//  MT101v5.1
//
//  Created by Matt Gemmell on 26/07/2010.
//  Copyright 2010 Instinctive Code.
//

#import <UIKit/UIKit.h>

@class MT101v5.1Controller;
@interface MGSplitDividerView : UIView {
	MT101v5.1Controller *splitViewController;
	BOOL allowsDragging;
}

@property (nonatomic, assign) MT101v5.1Controller *splitViewController; // weak ref.
@property (nonatomic, assign) BOOL allowsDragging;

- (void)drawGripThumbInRect:(CGRect)rect;

@end
