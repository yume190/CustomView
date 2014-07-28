//
//  ViewSource.m
//  CustomViewTest
//
//  Created by APP559 on 2014/7/28.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import "ViewSource.h"

@implementation ViewSource

+(ViewSource*) sharedInstance{
    static ViewSource *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [ViewSource new];
    });
    
    return sharedInstance;
}

-(NSDictionary*)test1{
    return @{@"type":@"CustomWithXibLiveRenderKVC",
             @"labelLeft":@"l",
             @"labelRight":@"r",
             @"buttonLeft":@"ll",
             @"buttonRight":@"rr"};
}

-(NSDictionary*)test2{
    return @{@"type":@"CustomWithXibLiveRenderKVC",
             @"labelLeft":@"left",
             @"labelRight":@"right",
             @"buttonLeft":@"btn left",
             @"buttonRight":@"btn right"};
}

-(NSDictionary*)test3{
    return @{@"type":@"CustomWithXibLiveRenderKVC",
             @"labelLeft":@"左",
             @"labelRight":@"右",
             @"buttonLeft":@"按鈕左",
             @"buttonRight":@"按鈕右"};
}
@end
