//
//  yumeViewController.m
//  CustomViewTest
//
//  Created by APP559 on 2014/4/30.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import "yumeViewController.h"
#import "TemplateView1.h"

@interface yumeViewController ()<TemplateView1Delegate>

@end

@implementation yumeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)TemplateView:(TemplateView1 *)templateView WithValueChange:(float)value{
    NSLog(@"value : %0.f",value);
}

@end
