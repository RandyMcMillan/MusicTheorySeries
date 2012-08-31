//
//  MyUIButton.m
//  UIButtonTest
//
//  Created by John Barnhart on 11/2/11.
//  Copyright (c) 2011 John Barnhart. All rights reserved.
//

#import "ColorUIButton.h"

@implementation ColorUIButton

@synthesize radius, fillColor, strokeColor, lineWidth, tapColor, tapStrokeColor, noGradient;

static inline float radians(double degrees) { return degrees * M_PI / 180; };

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
 
    // Set up defaults if none are specified.
    // You could also do this with a custom getter. If the value is nil, return default value.
    
    if (!self.radius) {
        self.radius = 10.0;
    }
    
    // The corner radius can't be more than half of either dimension of the rect, or else it will overlap.
    if (radius > self.frame.size.width / 2.0) {
        radius = self.frame.size.width / 2.0;
    }
    if (radius > self.frame.size.height / 2) {
        radius = self.frame.size.height / 2;
    }

    if (!self.lineWidth) {
        self.lineWidth = 0.3;
    }
    
    if (self.lineWidth > self.frame.size.width / 2.0) {
        self.lineWidth = self.frame.size.width / 2.0;
    }

    if (self.lineWidth > self.frame.size.height / 2.0) {
        self.lineWidth = self.frame.size.height / 2.0;
    }

    if (!self.fillColor) {
        self.fillColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    }
    
    if (!self.strokeColor) {
        self.strokeColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    }
    
    if (!self.tapStrokeColor) {
        self.tapStrokeColor = self.strokeColor;
    }
    
    if (!self.tapColor) {
        self.tapColor = [UIColor colorWithRed:0.0 green:0.36470588 blue:0.96078431 alpha:1.0];
    }
    
    float x = lineWidth / 2 + .5; // The + .5 is to adjust for clipping of antialiasing. This is kind of a hack and could be improved.
    float y = lineWidth / 2 + .5;

    float width = self.frame.size.width - x;
    float height = self.frame.size.height - y;
    
    //x = 0; y = 0; width = self.frame.size.width; height = self.frame.size.height;
    
    const CGFloat *cgFillColor;
    const CGFloat *cgStrokeColor;
        
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    
    // Check to see if it is being tapped and adjust the fill color accordingly;
    if (tap) {
        cgFillColor = CGColorGetComponents([tapColor CGColor]);
        cgStrokeColor = CGColorGetComponents([tapStrokeColor CGColor]);
    }
    else {
        cgFillColor = CGColorGetComponents([fillColor CGColor]);
        cgStrokeColor = CGColorGetComponents([strokeColor CGColor]);
    }
     
    // Create a path ref that we can use multiple times:
    // 1. Fill
    // 2. Gradient
    // 3. Stroke
    //
    // You can't just fill and stroke it simultaneously, because the fill has a gradient when tapped.
    // This gradient must be clipped, but the stroke must not be clipped.
    
    CGMutablePathRef myPath = CGPathCreateMutable();
    CGPathMoveToPoint(myPath, NULL, x + radius, y);
    CGPathAddLineToPoint(myPath, NULL, width - radius, y);
    CGPathAddArc(myPath, NULL, width - radius, y + radius, radius, radians(-90), 0, 0);
    CGPathAddLineToPoint(myPath, NULL, width, height - radius);
    CGPathAddArc(myPath, NULL, width - radius, height - radius, radius, radians(0), radians(90), 0);
    CGPathAddLineToPoint(myPath, NULL, x + radius, height);    
    CGPathAddArc(myPath, NULL, x + radius, height - radius, radius, radians(90), radians(180), 0);
    CGPathAddLineToPoint(myPath, NULL, x, y + radius);
    CGPathAddArc(myPath, NULL, x + radius, y + radius, radius, radians(180), radians(270), 0);
    
    CGContextAddPath(myContext, myPath);
    CGContextSetFillColor(myContext, cgFillColor);
    CGContextDrawPath(myContext, kCGPathFill);

    
    
    if (!noGradient) {
        
        CGGradientRef myGradient;
        CGColorSpaceRef myColorspace;
        size_t num_locations = 2;    
        CGFloat locations[2] = { 0.0, 1.0 };
        CGFloat components[8] = { 1.0, 1.0, 1.0, 0.0,  // Start color
            
            1.0, 1.0, 1.0, 0.3}; // End color
        
        
        
        myColorspace = CGColorSpaceCreateDeviceRGB();
        
        myGradient = CGGradientCreateWithColorComponents (myColorspace, components, locations, num_locations);

        CGContextSaveGState(myContext);
        CGContextAddPath(myContext, myPath);        
        CGContextClip(myContext);
        CGPoint myStartPoint, myEndPoint;
        myStartPoint.x = x;
        myStartPoint.y = height - y;
        myEndPoint.x = x;
        myEndPoint.y = y;
        CGContextDrawLinearGradient (myContext, myGradient, myStartPoint, myEndPoint, 0);
        CGGradientRelease(myGradient);
        CGColorSpaceRelease(myColorspace);
        CGContextRestoreGState(myContext);
    }
    
    
    CGContextAddPath(myContext, myPath);    
    CGContextSetStrokeColor(myContext, cgStrokeColor);    
    CGContextSetLineWidth(myContext, self.lineWidth);
    CGContextDrawPath(myContext, kCGPathStroke);
    
    CGPathRelease(myPath);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    tap = YES;
    [self setNeedsDisplay];
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    tap = NO;
    [self setNeedsDisplay];
    [super touchesEnded:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    float distance = 70.0;
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    CGRect testRect = CGRectMake(-distance, -distance, self.frame.size.width + distance * 2, self.frame.size.height + distance * 2);
    if (CGRectContainsPoint(testRect, touchPoint)) {
        tap = YES;
        [self setNeedsDisplay];
    }
    else {
        tap = NO;
        [self setNeedsDisplay];
    }
    [super touchesMoved:touches withEvent:event];
}



@end
