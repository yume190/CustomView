//
//  TemplateView2.h
//  test
//
//  Created by ALIGN-APP on 2014/4/28.
//  Copyright (c) 2014年 ALIGN-APP. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@class TemplateView1;
@protocol TemplateView1Delegate<NSObject>
-(void)TemplateView:(TemplateView1*)templateView WithValueChange:(float)value;
@end

@interface TemplateView1 : UIView
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelNumber;
@property (strong, nonatomic) IBOutlet UIStepper *stepper;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *labelMin;
@property (strong, nonatomic) IBOutlet UILabel *labelDefault;
@property (strong, nonatomic) IBOutlet UILabel *labelMax;
@property (strong, nonatomic) IBOutlet UILabel *labelLeftTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelRightTitle;

@property (nonatomic) IBInspectable NSInteger lineWidth;
@property (nonatomic) IBInspectable UIColor *fillColor;

@property (assign) NSString* vTitle;
@property (assign) NSString* vLeftTitle;
@property (assign) NSString* vRightTitle;
@property (assign) NSNumber* vMin;
@property (assign) NSNumber* vDefault;
@property (assign) NSNumber* vMax;

@property (nonatomic,strong) IBOutlet UIView * view;

- (id)initWithCoder:(NSCoder *)aDecoder;
-(void)resetViewValue;
@property (weak) IBOutlet id <TemplateView1Delegate>delegate;

- (id)initWithMin:(double)minValue WithMax:(double)maxValue WithDefault:(double)defaultValue;
@end

