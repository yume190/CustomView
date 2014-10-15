//
//  CustomViewTemplate.m

//
//  Created by APP559 on 2014/7/28.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import "CustomViewTemplate.h"
#import "ViewSource.h"

@implementation CustomViewTemplate

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
//        self.translatesAutoresizingMaskIntoConstraints = NO;
//        Update Constraints
//        Can add custom view constraints here via updateConstraints
//        • Trigger via
//        setNeedsUpdateConstraints
        
//        Laying Out Views
//        Can be triggered via setNeedsLayout
//        • Force instant-refresh via
//        layoutIfNeeded
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

- (void) setup{
    NSString *nibName = NSStringFromClass([self class]);
    
    UINib *nib = [UINib nibWithNibName:nibName bundle:[self frameworkBundle]];
    
    [nib instantiateWithOwner:self options:nil];
}

-(void)prepareForInterfaceBuilder{
    [super prepareForInterfaceBuilder];
    [self viewLiveRendering];
}


- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
//    [self setNeedsUpdateConstraints];
//    [self layoutIfNeeded];
//    [self setNeedsLayout];
#ifndef TARGET_INTERFACE_BUILDER
    [self viewLiveRendering];
#endif
    
    self.layer.borderColor = _borderColor.CGColor;
    self.layer.borderWidth = _borderLineWidth;
    
    if( [self.layer respondsToSelector:@selector(setCornerRadius:)] )
        [self.layer setCornerRadius:_borderRadius];
}

-(void)viewLiveRendering{
    
    if ([self respondsToSelector:@selector(processViewSource)]) {
        if (_viewSourceKeyPath) {
            _viewSourceDictionary =  [ViewSourceInstance valueForKey:_viewSourceKeyPath];
            
            NSString *type = _viewSourceDictionary[@"type"];
            NSString *className = NSStringFromClass([self class]);
            
            if ([className isEqualToString:type]) {
                [self processViewSource];
            }
        }
    }
    
    if ([self respondsToSelector:@selector(processStoryBoardSource)]) {
        [self processStoryBoardSource];
    }
    
    if ([self respondsToSelector:@selector(processFuture)]) {
        [self processFuture];
    }
    
}

- (NSBundle *)frameworkBundle{
    return [NSBundle bundleWithIdentifier:[self bundleIdentifier]];
}

- (NSString *)bundleIdentifier{
    //Bundle Identifier can be find at Target -> Your Framework -> Bundle Identifier
    return @"com.yume190.CustomViewObjc";
}

-(id)debugQuickLookObject{
    return self;
}

@end
