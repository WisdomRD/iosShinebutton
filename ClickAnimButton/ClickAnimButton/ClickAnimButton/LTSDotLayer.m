//
//  LTSDotLayer.m
//  LTS
//
//  Created by Fangjw on 2018/4/3.
//  Copyright © 2018年 LTS. All rights reserved.
//

#import "LTSDotLayer.h"
#import "LTSAnimParams.h"

@interface LTSDotLayer()<CAAnimationDelegate>

@property (strong, nonatomic) NSMutableArray *smallShapeArray;

@property (strong, nonatomic) NSMutableArray *bigShapeArray;

@property (strong, nonatomic) CADisplayLink *displayLink;

@property (strong, nonatomic) LTSAnimParams *animParams;

@end

@implementation LTSDotLayer

-(instancetype)init:(CGRect)frame animParams:(LTSAnimParams *)animParams{
    self = [super init];
    if (self) {
        self.animParams = animParams;
        self.frame = frame;
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
    self.smallShapeArray = [NSMutableArray new];
    self.bigShapeArray = [NSMutableArray new];
    [self createLayer];
}

-(void)createLayer{
    CGFloat startAngle = 0;
    CGFloat angle = M_PI*2 /self.animParams.dotCount;
    if (self.animParams.dotCount%2 != 0) {
        startAngle = M_PI*2 - (angle/self.animParams.dotCount);
    }
    CGFloat radius = self.frame.size.width/2 * self.animParams.dotDisMultiple;
    
    for (int i =0; i < self.animParams.dotCount; i++) {
        CAShapeLayer *smallLayer = [CAShapeLayer new];
        CGPoint center = [self getShineCenter:startAngle + angle*i radius:radius];
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:self.animParams.smallDotSize startAngle:0 endAngle:M_PI*2 clockwise:false];
        smallLayer.path = path.CGPath;
        smallLayer.fillColor = self.animParams.smallDotColor.CGColor;
        [self addSublayer:smallLayer];
        [self.smallShapeArray addObject:smallLayer];
        
        CAShapeLayer *bigLayer = [CAShapeLayer new];
        CGPoint bigCenter = [self getShineCenter:startAngle + angle*i - self.animParams.dotOffsetAngle*M_PI/180 radius:radius-self.animParams.dotOffsetDis];
        UIBezierPath *bigPath = [UIBezierPath bezierPathWithArcCenter:bigCenter radius:self.animParams.bigDotSize startAngle:0 endAngle:M_PI*2 clockwise:false];
        bigLayer.path = bigPath.CGPath;
        bigLayer.fillColor = self.animParams.bigDotColor.CGColor;
        [self addSublayer:bigLayer];
        [self.bigShapeArray addObject:bigLayer];
    }
}

-(CGPoint)getShineCenter:(CGFloat)angle radius:(CGFloat)radius{
    CGFloat x=(radius)*cosf(angle);
    CGFloat y=(radius)*sinf(angle);
    return CGPointMake(self.frame.size.width/2+x, self.frame.size.height/2+y);
}

-(void)startAnim{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
    anim.duration  = self.animParams.dotDuration;
    anim.delegate = self;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    CGFloat startAngle = 0;
    CGFloat angle = M_PI*2 /self.animParams.dotCount;
    if (self.animParams.dotCount%2 != 0) {
        startAngle = M_PI*2 - (angle/self.animParams.dotCount);
    }
    CGFloat radius = self.frame.size.width/2 * self.animParams.dotDisMultiple;
    int s =0;
    int b =0;
    
    for (CAShapeLayer *layer in self.smallShapeArray) {
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:[self getShineCenter:startAngle + angle*s + self.animParams.dotTurnAngle*M_PI/180 radius:radius] radius:0.1 startAngle:0 endAngle:M_PI*2 clockwise:false];
        anim.toValue = (__bridge id _Nullable)(path.CGPath);
        [layer addAnimation:anim forKey:@"path"];
        s++;
    }
    for (CAShapeLayer *layer in self.bigShapeArray) {
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:[self getShineCenter:startAngle + angle*b - self.animParams.dotOffsetAngle*M_PI/180 + self.animParams.dotTurnAngle*M_PI/180 radius:radius-self.animParams.dotOffsetDis] radius:0.1 startAngle:0 endAngle:M_PI*2 clockwise:false];
        anim.toValue = (__bridge id _Nullable)(path.CGPath);
        [layer addAnimation:anim forKey:@"path"];
        b++;
    }
    if (self.animParams.enableFlashing) {
        [self flashAnim];
    }
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
    for (CAShapeLayer *layer in self.smallShapeArray) {
        layer.fillColor = (__bridge CGColorRef _Nullable)(self.animParams.colorRandom[arc4random()%self.animParams.colorRandom.count]);
    }
    for (CAShapeLayer *layer in self.bigShapeArray) {
        layer.fillColor = (__bridge CGColorRef _Nullable)(self.animParams.colorRandom[arc4random()%self.animParams.colorRandom.count]);
    }
}

-(void)flashAnim{
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnim.fromValue = @1;
    opacityAnim.toValue = @0.1;
    double duration = arc4random()%5/100;
    opacityAnim.duration = duration;
    opacityAnim.repeatCount = MAXFLOAT;
    for (CAShapeLayer *layer in self.smallShapeArray) {
        [layer addAnimation:opacityAnim forKey:@"opacity"];
    }
    for (CAShapeLayer *layer in self.bigShapeArray) {
        [layer addAnimation:opacityAnim forKey:@"opacity"];
    }
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
    [self removeAllAnimations];
    [self removeFromSuperlayer];
}

@end
