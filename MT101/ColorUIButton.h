//
//  MyUIButton.h
//  UIButtonTest
//
//  Created by John Barnhart on 11/2/11.
//  Copyright (c) 2011 John Barnhart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorUIButton : UIButton {
    float       radius;
    float       lineWidth;
    UIColor*    fillColor;
    UIColor*    strokeColor;
    UIColor*    tapColor;
    UIColor*    tapStrokeColor;
    BOOL        tap;
    BOOL        noGradient;
}

@property float                         radius;
@property float                         lineWidth;
@property BOOL                          noGradient;
@property (nonatomic, retain) UIColor*  fillColor;
@property (nonatomic, retain) UIColor*  strokeColor;
@property (nonatomic, retain) UIColor*  tapColor;
@property (nonatomic, retain) UIColor*  tapStrokeColor;

@end
