//
//  LTSAnimParams.h
//  LTS
//
//  Created by Fangjw on 2018/4/4.
//  Copyright © 2018年 LTS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LTSAnimParams : NSObject

/******************动画时间******************/
// 缩放
@property (nonatomic) double scaleDuration;
// 圈圈
@property (nonatomic) double circleDuration;
// 点
@property (nonatomic) double dotDuration;

/******************按钮图片******************/
//
@property (strong, nonatomic) UIImage *btnImage;

/******************颜色******************/
// 未点击
@property (strong, nonatomic) UIColor *normalColor;
// 点击
@property (strong, nonatomic) UIColor *clickColor;
// 圈圈
@property (strong, nonatomic) UIColor *circleColor;
// 小点
@property (strong, nonatomic) UIColor *smallDotColor;
// 大点
@property (strong, nonatomic) UIColor *bigDotColor;
// 随机的颜色列表
@property (strong, nonatomic) NSMutableArray *colorRandom;

/******************圈属性******************/
//圈宽
@property (nonatomic) CGFloat circleWidth;
// 扩散范围的倍数
@property (nonatomic) CGFloat circleDisMultiple;

/******************点属性******************/
// 点的个数(一个包括一大点一小点)
@property (nonatomic) int dotCount;
// 小点的大小
@property (nonatomic) CGFloat smallDotSize;
// 大点的大小
@property (nonatomic) CGFloat bigDotSize;
// 大小点角度差异
@property (nonatomic) CGFloat dotOffsetAngle;
// 大小点距离差异
@property (nonatomic) CGFloat dotOffsetDis;
// 点的扩散的旋转角度
@property (nonatomic) CGFloat dotTurnAngle;
// 扩散范围的倍数
@property (nonatomic) CGFloat dotDisMultiple;

/******************BOOL******************/
// 是否点击
@property (assign, nonatomic) BOOL clicked;
// 是否变色效果
@property (assign, nonatomic) BOOL allowRandomColor;
// 是否Flash效果
@property (assign, nonatomic) BOOL enableFlashing;

/******************初始化******************/
//
-(void)initDate;

@end
