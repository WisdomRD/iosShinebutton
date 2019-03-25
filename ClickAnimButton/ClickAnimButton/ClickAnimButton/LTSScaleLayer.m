//
//  LTSScaleLayer.m
//  LTS
//
//  Created by Fangjw on 2018/4/3.
//  Copyright © 2018年 LTS. All rights reserved.
//

#import "LTSScaleLayer.h"
#import "LTSAnimParams.h"

@interface LTSScaleLayer()

@property (strong, nonatomic) CALayer *maksLayer;

@property (strong, nonatomic) LTSAnimParams *animParams;

@end

@implementation LTSScaleLayer

-(instancetype)init:(LTSAnimParams *)animParams{
    self = [super init];
    if (self) {
        self.animParams = animParams;
        [self initLayer];
        self.mask = self.maksLayer;
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initLayer];
        self.mask = self.maksLayer;
    }
    return self;
}

-(instancetype)initWithLayer:(id)layer{
    self = [super initWithLayer:layer];
    if (self) {
        [self initLayer];
        self.mask = self.maksLayer;
    }
    return self;
}

-(void)initLayer{
    self.maksLayer = [CALayer layer];
    self.maksLayer.contents = self.animParams.btnImage;
    if(self.animParams.clicked){
        self.backgroundColor = self.animParams.clickColor.CGColor;
    }else {
        self.backgroundColor = self.animParams.normalColor.CGColor;
    }
}

-(void)startAnim{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    anim.duration  = self.animParams.scaleDuration;
    anim.values = @[[NSNumber numberWithFloat:0.4], [NSNumber numberWithFloat:1], [NSNumber numberWithFloat:0.9], [NSNumber numberWithFloat:1]];
    anim.calculationMode = kCAAnimationCubic;
    [self.maksLayer addAnimation:anim forKey:@"scale"];
}

-(void)layoutSublayers{
    self.maksLayer.frame = self.bounds;
    if(self.animParams.clicked){
        self.backgroundColor = self.animParams.clickColor.CGColor;
    }else {
        self.backgroundColor = self.animParams.normalColor.CGColor;
    }
    self.maksLayer.contents = (__bridge id _Nullable)(self.animParams.btnImage.CGImage);
}

-(void)btnShowStatus{
    if(self.animParams.clicked){
        self.backgroundColor = self.animParams.clickColor.CGColor;
    }else {
        self.backgroundColor = self.animParams.normalColor.CGColor;
    }
}

@end
