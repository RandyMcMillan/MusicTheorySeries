//// General Declarations
CGContextRef context = UIGraphicsGetCurrentContext();

//// Color Declarations
UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];

//// Image Declarations
UIImage* image = [UIImage imageNamed: @"image"];
UIColor* imagePattern = [UIColor colorWithPatternImage: image];

//// Rounded Rectangle 1 Drawing
UIBezierPath* roundedRectangle1Path = [UIBezierPath bezierPath];
[roundedRectangle1Path moveToPoint: CGPointMake(54.34, 3)];
[roundedRectangle1Path addLineToPoint: CGPointMake(454.66, 3)];
[roundedRectangle1Path addCurveToPoint: CGPointMake(510, 62.06) controlPoint1: CGPointMake(485.22, 3) controlPoint2: CGPointMake(510, 29.44)];
[roundedRectangle1Path addLineToPoint: CGPointMake(510, 447.94)];
[roundedRectangle1Path addCurveToPoint: CGPointMake(454.66, 507) controlPoint1: CGPointMake(510, 480.56) controlPoint2: CGPointMake(485.22, 507)];
[roundedRectangle1Path addLineToPoint: CGPointMake(54.34, 507)];
[roundedRectangle1Path addCurveToPoint: CGPointMake(-1, 447.94) controlPoint1: CGPointMake(23.78, 507) controlPoint2: CGPointMake(-1, 480.56)];
[roundedRectangle1Path addLineToPoint: CGPointMake(-1, 62.06)];
[roundedRectangle1Path addCurveToPoint: CGPointMake(54.34, 3) controlPoint1: CGPointMake(-1, 29.44) controlPoint2: CGPointMake(23.78, 3)];
[roundedRectangle1Path closePath];
[fillColor setFill];
[roundedRectangle1Path fill];


//// Background copy 2 Drawing
UIBezierPath* backgroundCopy2Path = [UIBezierPath bezierPathWithRect: CGRectMake(-5, 0, 520, 520)];
CGContextSaveGState(context);
CGContextSetPatternPhase(context, CGSizeMake(-5, 0));
[imagePattern setFill];
[backgroundCopy2Path fill];
CGContextRestoreGState(context);


//// Layer 1 Drawing


