//
//  LTSCircleLayer.m
//  LTS
//
//  Created by Fangjw on 2018/4/3.
//  Copyright © 2018年 LTS. All rights reserved.
//

#import "LTSCircleLayer.h"
#import "LTSDotLayer.h"
#import "LTSAnimParams.h"

@interface LTSCircleLayer()<CAAnimationDelegate>

@property (strong, nonatomic) CAShapeLayer *shapeLayer;

@property (strong, nonatomic) CADisplayLink *displayLink;

@property (strong, nonatomic) LTSAnimParams *animParams;

@end

@implementation LTSCircleLayer

-(instancetype)init:(LTSAnimParams *)animParams{
    self = [super init];
    if (self) {
        self.animParams = animParams;
        [self initLayer];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initLayer];
    }
    return self;
}

-(instancetype)initWithLayer:(id)layer{
    self = [super initWithLayer:layer];
    if (self) {
        [self initLayer];
    }
    return self;
}

-(void)initLayer{
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self addSublayer:self.shapeLayer];
}

-(void)startAnim{
    self.shapeLayer.strokeColor = self.animParams.circleColor.CGColor;
    self.shapeLayer.lineWidth = self.animParams.circleWidth;
//变形动画
    CABasicAnimation *baseAnim = [CABasicAnimation animationWithKeyPath:@"path"];
    baseAnim.delegate = self;
    baseAnim.duration  = self.animParams.circleDuration;
    UIBezierPath *fromPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.width/2 startAngle:0 endAngle:M_PI*2 clockwise:false];
    UIBezierPath *toPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.width/2*self.animParams.circleDisMultiple startAngle:0 endAngle:M_PI*2 clockwise:false];
    baseAnim.fromValue = (__bridge id _Nullable)(fromPath.CGPath);
    baseAnim.toValue = (__bridge id _Nullable)(toPath.CGPath);
    [self.shapeLayer addAnimation:baseAnim forKey:@"path"];
    
    if (self.animParams.allowRandomColor) {
        [self changeColor];
    }
}

//变色效果动画
-(void)changeColor{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(colorAnim:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    if(@available(iOS 10.0, *)){
        self.displayLink.preferredFramesPerSecond = 6;
    }else {
        self.displayLink.frameInterval = 10;
    }
}

-(void)colorAnim:(CADisplayLink *)link{
    self.shapeLayer.strokeColor = (__bridge CGColorRef _Nullable)(self.animParams.colorRandom[arc4random()%self.animParams.colorRandom.count]);
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
    [self.shapeLayer removeAllAnimations];
    LTSDotLayer *dotLayer = [[LTSDotLayer alloc]init:self.bounds animParams:self.animParams];
    [self addSublayer:dotLayer];
    [dotLayer startAnim];
}

@end
