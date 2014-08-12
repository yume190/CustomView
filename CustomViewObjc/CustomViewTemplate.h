//
//  CustomViewTemplate.h
//
//  Created by APP559 on 2014/7/28.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomViewTemplate;
@protocol CustomViewTemplateProtocol<NSObject>
@optional
-(void)setup;
-(void)viewLiveRendering;

-(void)processViewSource;
-(void)processStoryBoardSource;
-(void)processFuture;
@end

IB_DESIGNABLE
@interface CustomViewTemplate : UIView <CustomViewTemplateProtocol>
@property (nonatomic) IBInspectable float borderLineWidth;
@property (nonatomic) IBInspectable float borderRadius;
@property (nonatomic) IBInspectable UIColor *borderColor;

@property (nonatomic) IBInspectable NSString *viewSourceKeyPath;
@property (nonatomic,strong) NSDictionary *viewSourceDictionary;
@end
