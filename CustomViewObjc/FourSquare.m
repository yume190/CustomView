//
//  FourSquare.m
//  CustomViewTest
//
//  Created by Yume on 2014/10/8.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import "FourSquare.h"

@interface FourSquare ()
@property (strong, nonatomic) IBOutlet UIView *view;

@end

@implementation FourSquare

-(void)updateConstraints{
    //    [super updateConstraints];
    NSDictionary *views = @{ @"view" : self.view };
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:views]];
    [super updateConstraints];
}

-(void)setup{
    [super setup];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.view];
}

-(void)viewLiveRendering{
    [super viewLiveRendering];
    self.view.backgroundColor = [UIColor clearColor];
}

//-(void)processViewSource{
//    _labelLeft.text = self.viewSourceDictionary[@"labelLeft"];
//    _labelRight.text = self.viewSourceDictionary[@"labelRight"];
//    [_buttonLeft setTitle:self.viewSourceDictionary[@"buttonLeft"] forState:UIControlStateNormal];
//    [_buttonRight setTitle:self.viewSourceDictionary[@"buttonRight"] forState:UIControlStateNormal];
//}

@end
