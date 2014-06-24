//
//  CustomViewObjetiveC.m
//  CustomViewTest
//
//  Created by Yume on 2014/6/3.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import "CustomViewObjetiveC.h"

@interface CustomViewObjetiveC(){
    dispatch_once_t onceTokenViewLiveRendering;
}
@property (nonatomic,strong) UILabel *label;
@end

@implementation CustomViewObjetiveC

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    _label = [UILabel new];
    [self addSubview:_label];
    self.backgroundColor = [UIColor whiteColor];
}


-(void)prepareForInterfaceBuilder{
    [self viewLiveRendering];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect    myFrame = self.bounds;
    
    // Set the line width to 10 and inset the rectangle by
    // 5 pixels on all sides to compensate for the wider line.
    CGContextSetLineWidth(context, _lineWidth);
    CGRectInset(myFrame, 5, 5);
    
    [_fillColor set];
    UIRectFrame(myFrame);
    
#ifndef TARGET_INTERFACE_BUILDER
    [self viewLiveRendering];
#endif
}

-(void)viewLiveRendering{
    dispatch_once(&onceTokenViewLiveRendering, ^{
        _label.frame = _labelRect;
        _label.text = _labelText;
        _label.textColor = _labelColor;
    });
}

#pragma mark - Custom Quick Look

// OS Types Supporting debugQuickLookObject :
//      https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/CustomClassDisplay_in_QuickLook/CH02-std_objects_support/CH02-std_objects_support.html#//apple_ref/doc/uid/TP40014001-CH3-SW1
-(id)debugQuickLookObject{
    return self;
}

@end
