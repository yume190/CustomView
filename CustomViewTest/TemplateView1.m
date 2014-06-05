//
//  TemplateView2.m
//  test
//
//  Created by ALIGN-APP on 2014/4/28.
//  Copyright (c) 2014年 ALIGN-APP. All rights reserved.
//

#import "TemplateView1.h"

#define SLIDER_WAIT_INTERVAL 0.1

@interface TemplateView1()
{
    double viewDefaultValue;
    NSDate *beginTime;
}

@end

@implementation TemplateView1
@synthesize labelTitle;
@synthesize labelLeftTitle;
@synthesize labelRightTitle;
@synthesize labelNumber;
@synthesize stepper;
@synthesize slider;
@synthesize labelMin;
@synthesize labelDefault;
@synthesize labelMax;

@synthesize vTitle;
@synthesize vLeftTitle;
@synthesize vRightTitle;
@synthesize vMin;
@synthesize vDefault;
@synthesize vMax;

- (void)awakeFromNib {
    labelTitle.text = vTitle;
    labelLeftTitle.text = vLeftTitle;
    labelRightTitle.text = vRightTitle;
    labelNumber.text = [NSString stringWithFormat:@" %0.f",[vDefault floatValue]];
    
    [stepper setMinimumValue:[vMin floatValue]];
    [stepper setMaximumValue:[vMax floatValue]];
    [stepper setStepValue:1];
    
    slider.minimumValue = [vMin floatValue];
    slider.maximumValue = [vMax floatValue];
    
    [self setViewValue:[vDefault floatValue]];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"HA! caught you trying to set undefined key %@ to %@",key,value);
}

- (void) setup{
    NSString *nibName = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    //Add the view loaded from the nib into self.
    [self addSubview:self.view];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self setup];
        
        self.layer.borderColor = [UIColor grayColor].CGColor ;
        self.layer.borderWidth = 3.0f;
        
        if( [self.layer respondsToSelector:@selector(setCornerRadius:)] )
            [self.layer setCornerRadius:10];
        
        [stepper addTarget:self action:@selector(stepperValueIschanged:) forControlEvents:UIControlEventValueChanged];
        
        [slider addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sliderTapped:)];
        [slider addGestureRecognizer:tapGestureRecognizer];
        
        viewDefaultValue = [vDefault floatValue];
        
        beginTime = [NSDate date];
    }
    return self;
}

- (id)initWithMin:(double)minValue WithMax:(double)maxValue WithDefault:(double)defaultValue
{
    self = [super init];
    if (self) {
        self.layer.borderColor = [UIColor grayColor].CGColor ;
        self.layer.borderWidth = 3.0f;
        
        if( [self.layer respondsToSelector:@selector(setCornerRadius:)] )
            [self.layer setCornerRadius:10];
        
        labelTitle=[[UILabel alloc] initWithFrame:CGRectMake(8, 5, 220, 26)];
        [labelTitle setFont:[UIFont boldSystemFontOfSize:22]];
        [self addSubview:labelTitle];
        
        labelNumber=[[UILabel alloc] initWithFrame:CGRectMake(220, 0, 90, 56)];
        labelNumber.text = [NSString stringWithFormat:@" %0.f",defaultValue];
        labelNumber.textAlignment=YES;
        [labelNumber setFont:[UIFont systemFontOfSize:39]];
        [self addSubview:labelNumber];
        
        
        stepper=[[UIStepper alloc] initWithFrame:CGRectMake(220, 50, 94, 29)];
        [stepper setMinimumValue:minValue];
        [stepper setMaximumValue:maxValue];
        [stepper setValue:defaultValue];
        [stepper setStepValue:1];
        [self addSubview:stepper];
        
        slider=[[UISlider alloc] initWithFrame:CGRectMake(8, 30, 200, 37)];
        slider.minimumValue = minValue;
        slider.maximumValue = maxValue;
        slider.value = defaultValue;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sliderTapped:)];
        [slider addGestureRecognizer:tapGestureRecognizer];
        //为slider添加方法当slider的值改变时就会触发change方法
        slider.continuous = YES;
        [self addSubview:slider];
        
        labelMin=[[UILabel alloc] initWithFrame:CGRectMake(8, 65, 50, 21)];
        labelMin.text = [NSString stringWithFormat:@"%0.f",minValue];
        [self addSubview:labelMin];
        
        labelDefault=[[UILabel alloc] initWithFrame:CGRectMake(98, 65, 50, 21)];
        labelDefault.text = [NSString stringWithFormat:@"%0.f",defaultValue];
        [self addSubview:labelDefault];
        
        labelMax=[[UILabel alloc] initWithFrame:CGRectMake(188, 65, 50, 21)];
        labelMax.text = [NSString stringWithFormat:@"%0.f",maxValue];
        [self addSubview:labelMax];
        viewDefaultValue=defaultValue;
    }
    return self;
}

-(void)setViewValue:(float)value{
    slider.value = value;
    stepper.value = value;
    labelNumber.text = [NSString stringWithFormat:@" %0.f",value];
    [self.delegate TemplateView:self WithValueChange:value];
}

- (IBAction)change:(UISlider *)sender{
    NSDate *currentTime = [NSDate date];
    NSTimeInterval interval = [currentTime timeIntervalSinceDate:beginTime];
    if (interval > SLIDER_WAIT_INTERVAL) {
        NSLog(@"interval2 %f",interval);
        beginTime = currentTime;
    }else{
        return;
    }
    
    int progresAsInt = (int)( slider.value +0.5f);
    [self setViewValue:progresAsInt];
}

- (IBAction)sliderTouchEnd:(UISlider *)sender {
    NSLog(@"touch end");
    
    int progresAsInt = (int)( slider.value +0.5f);
    [self setViewValue:progresAsInt];
}


- (void)sliderTapped:(UIGestureRecognizer *)gestureRecognizer
{
    UISlider* s = (UISlider*)gestureRecognizer.view;
    if (s.highlighted)
        return;
    CGPoint pt = [gestureRecognizer locationInView: s];
    CGFloat percentage = pt.x / s.bounds.size.width;
    CGFloat delta = percentage * (s.maximumValue - s.minimumValue);
    CGFloat value = s.minimumValue + delta;
    [s setValue:value animated:YES];
    int progresAsInt = (int)(slider.value +0.5f);
    [self setViewValue:progresAsInt];
}

- (IBAction)stepperValueIschanged:(id)sender{
    [self setViewValue:stepper.value];
}

-(void)resetViewValue{
    [self setViewValue:viewDefaultValue];
}

@end

