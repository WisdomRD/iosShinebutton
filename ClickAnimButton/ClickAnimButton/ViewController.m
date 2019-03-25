//
//  ViewController.m
//  ClickAnimButton
//
//  Created by Fangjw on 2018/4/4.
//  Copyright © 2018年 Fangjw. All rights reserved.
//

#import "ViewController.h"
#import "LTSAnimButton.h"
#import "LTSAnimParams.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LTSAnimParams *animParams1 = [LTSAnimParams new];
    [animParams1 initDate];
    animParams1.enableFlashing = YES;
    animParams1.circleColor = [UIColor orangeColor];
    animParams1.dotCount = 12;
    animParams1.circleDisMultiple = 4;
    animParams1.dotDisMultiple = 4;
    animParams1.smallDotSize = 10;
    animParams1.bigDotSize = 11;
    animParams1.dotOffsetAngle = 40;
    animParams1.dotTurnAngle = 30;
    animParams1.clickColor = [UIColor blueColor];
    animParams1.btnImage = [UIImage imageNamed:@"snow"];
    LTSAnimButton *animButton1 = [[LTSAnimButton alloc]initWithFrame:CGRectMake(10, 10, 50, 50) animParams:animParams1];
//    animButton1.center = CGPointMake(self.view.frame.size.width/2, 100);
    [self.view addSubview:animButton1];
    
    LTSAnimParams *animParams2 = [LTSAnimParams new];
    [animParams2 initDate];
    animParams2.enableFlashing = YES;
    animParams2.allowRandomColor = YES;
    animParams2.dotCount = 10;
    animParams2.circleDisMultiple = 3.5;
    animParams2.dotDisMultiple = 3.5;
    animParams2.smallDotSize = 8;
    animParams2.bigDotSize = 10;
    animParams2.btnImage = [UIImage imageNamed:@"star"];
    LTSAnimButton *animButton2 = [[LTSAnimButton alloc]initWithFrame:CGRectMake(100, 10, 50, 50) animParams:animParams2];
//    animButton2.center = CGPointMake(self.view.frame.size.width/2, 250);
    [self.view addSubview:animButton2];
    
    LTSAnimParams *animParams3 = [LTSAnimParams new];
    [animParams3 initDate];
    animParams3.allowRandomColor = YES;
    animParams3.dotCount = 8;
    animParams3.circleDisMultiple = 2;
    animParams3.dotDisMultiple = 2.5;
    animParams3.smallDotSize = 7;
    animParams3.bigDotSize = 8;
    animParams3.dotOffsetAngle = 40;
    animParams3.clickColor = [UIColor greenColor];
    animParams3.btnImage = [UIImage imageNamed:@"tree"];
    LTSAnimButton *animButton3 = [[LTSAnimButton alloc]initWithFrame:CGRectMake(200, 0, 50, 50) animParams:animParams3];
//    animButton3.center = CGPointMake(self.view.frame.size.width/2, 400);
    [self.view addSubview:animButton3];
    
    LTSAnimParams *animParams4 = [LTSAnimParams new];
    [animParams4 initDate];
    animParams1.circleColor = [UIColor orangeColor];
    animParams4.clickColor = [UIColor orangeColor];
    animParams4.btnImage = [UIImage imageNamed:@"present"];
    LTSAnimButton *animButton4 = [[LTSAnimButton alloc]initWithFrame:CGRectMake(300, 10, 50, 50) animParams:animParams4];
//    animButton4.center = CGPointMake(self.view.frame.size.width/2, 550);
    [self.view addSubview:animButton4];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
