//
//  LTSAnimParams.m
//  LTS
//
//  Created by Fangjw on 2018/4/4.
//  Copyright © 2018年 LTS. All rights reserved.
//

#import "LTSAnimParams.h"

#define RandomColor(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:((a)/1.0)] //颜色设置

@implementation LTSAnimParams

-(void)initDate{
/******************动画时间******************/
    // 缩放
    self.scaleDuration = 0.5;
    // 圈圈
    self.circleDuration = 0.2;
    // 点
    self.dotDuration = 0.8;
/******************按钮图片******************/
    //
    self.btnImage =  [UIImage imageNamed:@"star"];
/******************颜色******************/
    // 未点击
    self.normalColor = RandomColor(203, 203, 203, 1);
    // 点击
    self.clickColor = RandomColor(244, 234, 42, 1);
    // 圈圈
    self.circleColor = RandomColor(255, 255, 255, 1);
    // 小点
    self.smallDotColor = RandomColor(236, 236, 236, 1);
    // 大点
    self.bigDotColor = RandomColor(255, 207, 193, 1);
    // 随机的颜色列表
    self.colorRandom =[@[(__bridge id)RandomColor(255, 255, 153, 1).CGColor,(__bridge id)RandomColor(255, 204, 204, 1).CGColor,
                         (__bridge id)RandomColor(153, 102, 153, 1).CGColor,
                         (__bridge id)RandomColor(255, 102, 102, 1).CGColor,
                         (__bridge id)RandomColor(255, 255, 102, 1).CGColor,
                         (__bridge id)RandomColor(244, 67, 54, 1).CGColor,
                         (__bridge id)RandomColor(102, 102, 102, 1).CGColor,
                         (__bridge id)RandomColor(204, 204, 0, 1).CGColor,
                         (__bridge id)RandomColor(102, 102, 102, 1).CGColor,
                         (__bridge id)RandomColor(153, 153, 51, 1).CGColor]mutableCopy];
/******************圈属性******************/
    //圈宽
    self.circleWidth = 0.5;
    // 扩散范围的倍数
    self.circleDisMultiple = 1.5;
/******************点属性******************/
    // 点的个数(一个包括一大点一小点)
    self.dotCount = 7;
    // 小点的大小
    self.smallDotSize = 6;
    // 大点的大小
    self.bigDotSize = 8;
    // 大小点之前的角度差异
    self.dotOffsetAngle = 30;
    // 大小点距离差异
    self.dotOffsetDis = 5;
    // 点的扩散的旋转角度
    self.dotTurnAngle = 15;
    // 点的扩散范围的倍数
    self.dotDisMultiple = 1.5;
/******************BOOL******************/
    // 是否点击
    self.clicked = false;
    // 是否变色效果
    self.allowRandomColor = false;
    // 是否Flash效果
    self.enableFlashing = false;
}

@end
