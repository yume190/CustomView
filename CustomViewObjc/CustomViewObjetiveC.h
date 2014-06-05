//
//  CustomViewObjetiveC.h
//  CustomViewTest
//
//  Created by Yume on 2014/6/3.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface CustomViewObjetiveC : UIView

#ifdef IBInspectable
@property (nonatomic) IBInspectable NSInteger lineWidth;
@property (nonatomic) IBInspectable UIColor *fillColor;
@property (nonatomic) IBInspectable UIColor *labelColor;
@property (nonatomic) IBInspectable NSString *labelText;
@property (nonatomic) IBInspectable CGRect labelRect;
#endif
@end
