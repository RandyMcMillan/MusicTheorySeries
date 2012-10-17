//
//

#import "GradientNavBar.h"

@interface GradientNavBar ()
@property (nonatomic, readonly) CGGradientRef   normalGradient;
@property (nonatomic, readonly) CGGradientRef   highlightGradient;
- (void)hesitateUpdate; // Used to catch and fix problem where quick
                        // taps don't get updated back to normal state
@end
#pragma mark -

@implementation GradientNavBar
@synthesize normalGradientColors;
@synthesize normalGradientLocations;
@synthesize highlightGradientColors;
@synthesize highlightGradientLocations;
@synthesize cornerRadius;
@synthesize strokeWeight, strokeColor;
@synthesize normalGradient, highlightGradient;
#pragma mark -
- (CGGradientRef)normalGradient
{
    if (normalGradient == NULL) {
        int     locCount = [normalGradientLocations count];
        CGFloat locations[locCount];

        for (int i = 0; i < [normalGradientLocations count]; i++) {
            NSNumber *location =
                [normalGradientLocations objectAtIndex:i];
            locations[i] = [location floatValue];
        }

        CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();

        normalGradient = CGGradientCreateWithColors(
            space, (CFArrayRef)normalGradientColors, locations);
        CGColorSpaceRelease(space);
    }

    return normalGradient;
}   /* normalGradient */

- (CGGradientRef)highlightGradient
{
    if (highlightGradient == NULL) {
        CGFloat locations[[highlightGradientLocations count]];

        for (int i = 0; i < [highlightGradientLocations count]; i++) {
            NSNumber *location =
                [highlightGradientLocations objectAtIndex:i];
            locations[i] = [location floatValue];
        }

        CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();

        highlightGradient =
            CGGradientCreateWithColors(space,
            (CFArrayRef)highlightGradientColors,
            locations);
        CGColorSpaceRelease(space);
    }

    return highlightGradient;
}   /* highlightGradient */

#pragma mark -
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self setOpaque:NO];
        self.backgroundColor = [UIColor clearColor];
    }

    return self;
}

#pragma mark -
#pragma mark Appearances

- (void)useTBStyle
{
    //  self.enabled = FALSE;
    NSMutableArray  *colors = [NSMutableArray arrayWithCapacity:3];
    UIColor         *color  = [UIColor clearColor]; // [UIColor

    // colorWithRed:0.864
    // green:0.864 blue:0.864
    // alpha:1.0];
    [colors addObject:(id)[color CGColor]];
    color = [UIColor colorWithRed:0.995 green:0.995 blue:0.995 alpha:1.0];
    [colors addObject:(id)[color CGColor]];
    color = [UIColor colorWithRed:0.956 green:0.956 blue:0.955 alpha:1.0];
    [colors addObject:(id)[color CGColor]];
    self.normalGradientColors       = colors;
    self.normalGradientLocations    = [NSMutableArray arrayWithObjects:
        [NSNumber numberWithFloat:0.0f],
        [NSNumber numberWithFloat:1.0f],
        [NSNumber numberWithFloat:0.601f],
        nil];

    NSMutableArray *colors2 = [NSMutableArray arrayWithCapacity:3];
    color = [UIColor colorWithRed:0.692 green:0.692 blue:0.691 alpha:1.0];
    [colors2 addObject:(id)[color CGColor]];
    color = [UIColor colorWithRed:0.995 green:0.995 blue:0.995 alpha:1.0];
    [colors2 addObject:(id)[color CGColor]];
    color = [UIColor colorWithRed:0.83 green:0.83 blue:0.83 alpha:1.0];
    [colors2 addObject:(id)[color CGColor]];
    self.highlightGradientColors    = colors2;
    self.highlightGradientLocations = [NSMutableArray arrayWithObjects:
        [NSNumber numberWithFloat:0.0f],
        [NSNumber numberWithFloat:1.0f],
        [NSNumber numberWithFloat:0.601f],
        nil];

    self.cornerRadius   = 5.0f;
    self.strokeColor    = [UIColor clearColor];
    self.strokeWeight   = 0.1f;
    //  [self setTitleColor:[UIColor darkGrayColor] forState:
    //      UIControlStateNormal];
    //  [self setTitleColor:[UIColor darkGrayColor] forState:
    //      UIControlStateHighlighted];
}   /* useTBStyle */

#pragma mark useYouTubeUIBar

- (void)useYouTubeUIBar
{
    // // Color Declarations
    UIColor *darkBar        = [UIColor colorWithRed:0.098 green:0.098 blue:0.098 alpha:1.000];  // [UIColor colorWithRed:0.173 green:0.169 blue:0.173 alpha:1.00];//[UIColor colorWithRed: 0.11 green: 0.11 blue: 0.11 alpha: 1];
    UIColor *lightBar       = [UIColor colorWithRed:0.098 green:0.098 blue:0.098 alpha:0.800];  // [UIColor colorWithRed:0.286 green:0.286 blue:0.290 alpha:0.800];//[UIColor colorWithRed:0.227 green:0.227 blue:0.231 alpha:1.000];//[UIColor colorWithRed:0.188 green:0.188 blue:0.192 alpha:1.000];//[UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1.000];//[UIColor colorWithRed: 0.378 green: 0.378 blue: 0.378 alpha: 1];
    UIColor *shadowColor2   = [UIColor colorWithRed:0.341 green:0.341 blue:0.341 alpha:1.000];  // [UIColor colorWithRed: 0.624 green: 0.624 blue: 0.624 alpha: 0.1];

    //  self.enabled = FALSE;
    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:3];

    UIColor *color = darkBar;

    [colors addObject:(id)[color CGColor]];

    color = darkBar; // [UIColor colorWithRed:0.995 green:0.995 blue:0.995 alpha:1.0];
    [colors addObject:(id)[color CGColor]];

    color = lightBar; // [UIColor colorWithRed:0.956 green:0.956 blue:0.955 alpha:1.0];
    [colors addObject:(id)[color CGColor]];

    self.normalGradientColors       = colors;
    self.normalGradientLocations    = [NSMutableArray arrayWithObjects:
        [NSNumber numberWithFloat:0.0f],
        [NSNumber numberWithFloat:0.4f],
        [NSNumber numberWithFloat:1.0f],
        nil];

    NSMutableArray *colors2 = [NSMutableArray arrayWithCapacity:3];
    color = [UIColor colorWithRed:0.692 green:0.692 blue:0.691 alpha:1.0];
    [colors2 addObject:(id)[color CGColor]];
    color = [UIColor colorWithRed:0.995 green:0.995 blue:0.995 alpha:1.0];
    [colors2 addObject:(id)[color CGColor]];
    color = [UIColor colorWithRed:0.83 green:0.83 blue:0.83 alpha:1.0];
    [colors2 addObject:(id)[color CGColor]];
    self.highlightGradientColors    = colors2;
    self.highlightGradientLocations = [NSMutableArray arrayWithObjects:
        [NSNumber numberWithFloat:0.0f],
        [NSNumber numberWithFloat:1.0f],
        [NSNumber numberWithFloat:0.601f],
        nil];

    self.cornerRadius   = 0.0f;
    self.strokeColor    = shadowColor2; // [UIColor lightGrayColor];
    self.strokeWeight   = 0.1f;
    //  [self setTitleColor:[UIColor darkGrayColor] forState:
    //      UIControlStateNormal];
    //  [self setTitleColor:[UIColor darkGrayColor] forState:
    //      UIControlStateHighlighted];
}   /* useTBStyle */

#pragma mark -
- (void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor clearColor];
    CGRect imageBounds =
        CGRectMake(0.0, 0.0, self.bounds.size.width - 0.5,
        self.bounds.size.height);

    CGGradientRef   gradient;
    CGContextRef    context = UIGraphicsGetCurrentContext();
    CGPoint         point2;

    CGFloat resolution = 0.5 *
        (self.bounds.size.width / imageBounds.size.width +
        self.bounds.size.height / imageBounds.size.height);

    CGFloat stroke = strokeWeight * resolution;

    if (stroke < 1.0) {
        stroke = ceil(stroke);
    } else {
        stroke = round(stroke);
    }

    stroke /= resolution;
    CGFloat             alignStroke = fmod(0.5 * stroke * resolution, 1.0);
    CGMutablePathRef    path        = CGPathCreateMutable();
    CGPoint             point       =
        CGPointMake((self.bounds.size.width - [self cornerRadius]),
        self.bounds.size.height - 0.5f);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPathMoveToPoint(path, NULL, point.x, point.y);
    point =
        CGPointMake(self.bounds.size.width - 0.5f,
        (self.bounds.size.height - [self cornerRadius]));
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPoint controlPoint1 =
        CGPointMake((self.bounds.size.width - ([self cornerRadius] / 2.f)),
        self.bounds.size.height - 0.5f);
    controlPoint1.x =
        (round(resolution * controlPoint1.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint1.y =
        (round(resolution * controlPoint1.y +
            alignStroke) - alignStroke) / resolution;
    CGPoint controlPoint2 =
        CGPointMake(self.bounds.size.width - 0.5f,
        (self.bounds.size.height - ([self cornerRadius] / 2.f)));
    controlPoint2.x =
        (round(resolution * controlPoint2.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint2.y =
        (round(resolution * controlPoint2.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
        controlPoint2.x, controlPoint2.y, point.x,
        point.y);
    point = CGPointMake(self.bounds.size.width - 0.5f,
        [self cornerRadius]);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    point = CGPointMake((self.bounds.size.width - [self cornerRadius]),
        0.0);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint1 =
        CGPointMake(self.bounds.size.width - 0.5f,
        ([self cornerRadius] / 2.f));
    controlPoint1.x =
        (round(resolution * controlPoint1.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint1.y =
        (round(resolution * controlPoint1.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint2 =
        CGPointMake((self.bounds.size.width - ([self cornerRadius] / 2.f)),
        0.0);
    controlPoint2.x =
        (round(resolution * controlPoint2.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint2.y =
        (round(resolution * controlPoint2.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
        controlPoint2.x, controlPoint2.y, point.x,
        point.y);
    point   = CGPointMake([self cornerRadius], 0.0);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    point   = CGPointMake(0.0, [self cornerRadius]);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint1   = CGPointMake(([self cornerRadius] / 2.f), 0.0);
    controlPoint1.x =
        (round(resolution * controlPoint1.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint1.y =
        (round(resolution * controlPoint1.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint2   = CGPointMake(0.0, ([self cornerRadius] / 2.f));
    controlPoint2.x =
        (round(resolution * controlPoint2.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint2.y =
        (round(resolution * controlPoint2.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
        controlPoint2.x, controlPoint2.y, point.x,
        point.y);
    point =
        CGPointMake(0.0, (self.bounds.size.height - [self cornerRadius]));
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    point = CGPointMake([self cornerRadius],
        self.bounds.size.height - 0.5f);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint1 =
        CGPointMake(0.0,
        (self.bounds.size.height - ([self cornerRadius] / 2.f)));
    controlPoint1.x =
        (round(resolution * controlPoint1.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint1.y =
        (round(resolution * controlPoint1.y +
            alignStroke) - alignStroke) / resolution;
    controlPoint2 = CGPointMake(([self cornerRadius] / 2.f),
        self.bounds.size.height - 0.5f);
    controlPoint2.x =
        (round(resolution * controlPoint2.x +
            alignStroke) - alignStroke) / resolution;
    controlPoint2.y =
        (round(resolution * controlPoint2.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y,
        controlPoint2.x, controlPoint2.y, point.x,
        point.y);
    point = CGPointMake((self.bounds.size.width - [self cornerRadius]),
        self.bounds.size.height - 0.5f);
    point.x =
        (round(resolution * point.x +
            alignStroke) - alignStroke) / resolution;
    point.y =
        (round(resolution * point.y +
            alignStroke) - alignStroke) / resolution;
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    CGPathCloseSubpath(path);

    //  if (self.state == UIControlStateHighlighted) {
    //      gradient = self.highlightGradient;
    //  } else {
    gradient = self.normalGradient;
    //  }

    CGContextAddPath(context, path);
    CGContextSaveGState(context);
    CGContextEOClip(context);
    point = CGPointMake((self.bounds.size.width / 2.0),
        self.bounds.size.height - 0.5f);
    point2 = CGPointMake((self.bounds.size.width / 2.0), 0.0);
    CGContextDrawLinearGradient(context, gradient, point, point2,
        (kCGGradientDrawsBeforeStartLocation |
            kCGGradientDrawsAfterEndLocation));
    CGContextRestoreGState(context);
    [strokeColor setStroke];
    CGContextSetLineWidth(context, stroke);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    CGPathRelease(path);
}   /* drawRect */

#pragma mark -
#pragma mark Touch Handling
- (void)hesitateUpdate
{
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self setNeedsDisplay];
    [self   performSelector :@selector(hesitateUpdate) withObject:nil
            afterDelay      :0.1];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self setNeedsDisplay];
    [self   performSelector :@selector(hesitateUpdate) withObject:nil
            afterDelay      :0.1];
}

#pragma mark -
#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:[self normalGradientColors] forKey:
        @"normalGradientColors"];
    [encoder encodeObject:[self normalGradientLocations] forKey:
        @"normalGradientLocations"];
    [encoder encodeObject:[self highlightGradientColors] forKey:
        @"highlightGradientColors"];
    [encoder encodeObject:[self highlightGradientLocations] forKey:
        @"highlightGradientLocations"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {
        [self setNormalGradientColors:[decoder decodeObjectForKey:
                @"normalGradientColors"]];
        [self setNormalGradientLocations:[decoder decodeObjectForKey:
                @"normalGradientLocations"]];
        [self setHighlightGradientColors:[decoder decodeObjectForKey:
                @"highlightGradientColors"]];
        [self setHighlightGradientLocations:[decoder decodeObjectForKey
                :@"highlightGradientLocations"]];
        self.strokeColor =
            [UIColor colorWithRed:0.076 green:0.103 blue:0.195 alpha:1.0];
        self.strokeWeight = 0.0;

        if (self.normalGradientColors == nil) {
            // [self useWhiteStyle];
        }

        [self setOpaque:NO];
        self.backgroundColor =
            [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    }

    return self;
}   /* initWithCoder */

+ (NSString *)resolveImageResource:(NSString *)resource
{
    NSString    *systemVersion  = [[UIDevice currentDevice] systemVersion];
    BOOL        isLessThaniOS4  =
        ([systemVersion compare:@"4.0" options:NSNumericSearch] ==
        NSOrderedAscending);

    if (isLessThaniOS4) {
        return [NSString stringWithFormat:@"%@.png", resource];
    } else {
        if (([[UIScreen mainScreen] respondsToSelector:@selector(scale)]
                == YES) && ([[UIScreen mainScreen] scale] == 2.00)) {
            return [NSString stringWithFormat:@"%@@2x.png", resource];
        }
    }

    return resource;    // if all else fails
}                       /* resolveImageResource */

#pragma mark -
- (void)dealloc
{
    [normalGradientColors release];
    [normalGradientLocations release];
    [highlightGradientColors release];
    [highlightGradientLocations release];
    [strokeColor release];

    if (normalGradient != NULL) {
        CGGradientRelease(normalGradient);
    }

    if (highlightGradient != NULL) {
        CGGradientRelease(highlightGradient);
    }

    [super dealloc];
}   /* dealloc */

@end
