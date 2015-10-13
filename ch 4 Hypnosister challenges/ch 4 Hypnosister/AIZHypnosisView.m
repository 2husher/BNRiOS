//
//  AIZHypnosisView.m
//  ch 4 Hypnosister
//
//  Created by X on 12/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZHypnosisView.h"

@implementation AIZHypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    [self drawCircles:context];
    [self drawGradient:context];
    [self drawImage:context];
}

-(CGPoint)getViewCenter
{
    CGRect viewBounds = self.bounds;
    CGPoint center;
    center.x = viewBounds.origin.x + viewBounds.size.width / 2.0;
    center.y = viewBounds.origin.y + viewBounds.size.height / 2.0;
    return center;
}

- (void) drawCircles:(CGContextRef)context
{

    CGRect viewBounds = self.bounds;
    CGPoint center    = [self getViewCenter];

    float maxRadius = hypot(viewBounds.size.width, viewBounds.size.height) / 2.0;

    UIBezierPath *path = [[UIBezierPath alloc] init];

    for (float radius = maxRadius; radius > 0; radius -= 20)
    {
        [path moveToPoint:CGPointMake(center.x + radius, center.y)];
        [path addArcWithCenter:center
                        radius:radius
                    startAngle:0.0
                      endAngle:2.0 * M_PI
                     clockwise:YES];
    }
    path.lineWidth = 10.0;
    [[UIColor lightGrayColor] setStroke];
    [path stroke];
}

-(void)drawImage:(CGContextRef)context
{
    CGRect viewBounds = self.bounds;
    CGPoint center    = [self getViewCenter];

    CGContextSaveGState(context);
    CGContextSetShadow(context, CGSizeMake(4,7), 3);

    UIImage *image = [UIImage imageNamed:@"logo"];
    CGRect imageRect = CGRectMake(viewBounds.origin.x + center.x / 2.0,
                                  viewBounds.origin.y + center.y / 2.0,
                                  viewBounds.size.width / 2.0,
                                  viewBounds.size.height / 2.0);
    [image drawInRect:imageRect];

    CGContextRestoreGState(context);
}

-(void)drawGradient:(CGContextRef)context
{
    CGContextSaveGState(context);

    CGRect viewBounds = self.bounds;
    CGFloat dist      = viewBounds.size.height / 5.0;
    CGPoint center    = [self getViewCenter];

    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(center.x, viewBounds.origin.y + dist)];
    [path addLineToPoint:CGPointMake(center.x / 2.0, viewBounds.origin.y + 4.0 * dist)];
    [path addLineToPoint:CGPointMake(center.x * 3.0 / 2.0, viewBounds.origin.y + 4.0 * dist)];
    [path closePath];
    [path addClip];

    CGFloat components[8] = {
        0.0, 1.0, 0.0, 1.0,
        1.0, 1.0, 0.0, 1.0 };
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient     = CGGradientCreateWithColorComponents(colorspace,
                                                                     components, NULL, 2);
    CGPoint startPoint         = CGPointMake(viewBounds.origin.x,
                                             viewBounds.origin.y + dist);
    CGPoint endPoint           = CGPointMake(viewBounds.origin.x,
                                             viewBounds.origin.y + 4.0 * dist);
    CGContextDrawLinearGradient(context,
                                gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);


    CGContextRestoreGState(context);
}

@end























