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
        self.circleColor     = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGRect viewBounds = self.bounds;

    CGPoint center;
    center.x = viewBounds.origin.x + viewBounds.size.width / 2.0;
    center.y = viewBounds.origin.y + viewBounds.size.height / 2.0;

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

    [self.circleColor setStroke];

    [path stroke];
}

@end
