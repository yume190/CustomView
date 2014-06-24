//
//  yumeViewController.m
//  CustomViewTest
//
//  Created by APP559 on 2014/4/30.
//  Copyright (c) 2014年 yume. All rights reserved.
//

#import "yumeViewController.h"
#import "TemplateView1.h"
#import "CustomViewObjetiveC.h"

@interface yumeViewController ()<TemplateView1Delegate>{
    CustomViewObjetiveC *v;
}
@end

@implementation yumeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    v = [[CustomViewObjetiveC alloc]initWithFrame:CGRectMake(0, 0, 320, 160)];
//    v.label.frame = CGRectMake(10, 10, 50, 50);
//    v.label.text = @"ttasdfttt";
//    v.label.textColor = [UIColor purpleColor];
//    [self.view addSubview:v];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    v.layer.backgroundColor = [UIColor whiteColor].CGColor;
    v.backgroundColor = [UIColor orangeColor];
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
