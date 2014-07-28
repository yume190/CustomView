//
//  CustomWithXibLiveRenderKVC.m
//  CustomViewTest
//
//  Created by APP559 on 2014/7/28.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import "CustomWithXibLiveRenderKVC.h"
#import "ViewSource.h"

@interface CustomWithXibLiveRenderKVC()
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *labelLeft;
@property (weak, nonatomic) IBOutlet UILabel *labelRight;
@property (weak, nonatomic) IBOutlet UIButton *buttonLeft;
@property (weak, nonatomic) IBOutlet UIButton *buttonRight;
@end

@implementation CustomWithXibLiveRenderKVC

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
    NSString *nibName = NSStringFromClass([self class]);
    
    //Bundle Identifier can be find at Target -> Your Framework -> Bundle Identifier
    NSBundle *frameworkBundle = [NSBundle bundleWithIdentifier:@"com.yume190.CustomViewObjc"];
    
    UINib *nib = [UINib nibWithNibName:nibName bundle:frameworkBundle];
    
    [nib instantiateWithOwner:self options:nil];
    //Add the view loaded from the nib into self.
    [self addSubview:self.view];
}


-(void)prepareForInterfaceBuilder{
    [self viewLiveRendering];
}


- (void)drawRect:(CGRect)rect{
#ifndef TARGET_INTERFACE_BUILDER
    [self viewLiveRendering];
#endif
    
    self.layer.borderColor = _borderColor.CGColor;
    self.layer.borderWidth = _borderLineWidth;
    
    if( [self.layer respondsToSelector:@selector(setCornerRadius:)] )
        [self.layer setCornerRadius:_borderRadius];
}

-(void)viewLiveRendering{
    self.view.backgroundColor = [UIColor clearColor];
    
    [self processViewSource];
    
    [self processFuture];
}

-(void)processViewSource{
    if (_viewSourceKeyPath) {
        NSDictionary *dict =  [ViewSourceInstance valueForKey:_viewSourceKeyPath];
        
        NSString *type = dict[@"type"];
        NSString *className = NSStringFromClass([self class]);
        
        if ([className isEqualToString:type]) {
            _labelLeft.text = dict[@"labelLeft"];
            _labelRight.text = dict[@"labelRight"];
            [_buttonLeft setTitle:dict[@"buttonLeft"] forState:UIControlStateNormal];
            [_buttonRight setTitle:dict[@"buttonRight"] forState:UIControlStateNormal];
        }
        
    }
}

-(void)processFuture{

}

#pragma mark - Custom Quick Look

// OS Types Supporting debugQuickLookObject :
//      https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/CustomClassDisplay_in_QuickLook/CH02-std_objects_support/CH02-std_objects_support.html#//apple_ref/doc/uid/TP40014001-CH3-SW1
-(id)debugQuickLookObject{
    return self;
}

@end
