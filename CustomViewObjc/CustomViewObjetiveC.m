//
//  CustomViewObjetiveC.m
//  CustomViewTest
//
//  Created by Yume on 2014/6/3.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import "CustomViewObjetiveC.h"

@implementation CustomViewObjetiveC

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
//        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    UILabel *l =[[UILabel alloc] initWithFrame:_labelRect];
    l.text = _labelText;
    l.textColor = _labelColor;
    [self addSubview:l];
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect    myFrame = self.bounds;
    
    // Set the line width to 10 and inset the rectangle by
    // 5 pixels on all sides to compensate for the wider line.
    CGContextSetLineWidth(context, _lineWidth);
    CGRectInset(myFrame, 5, 5);
    
    [_fillColor set];
    UIRectFrame(myFrame);
}


@end
