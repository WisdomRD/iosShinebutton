//
//  LTSAnimButton.m
//  LTS
//
//  Created by Fangjw on 2018/4/3.
//  Copyright © 2018年 LTS. All rights reserved.
//

#import "LTSAnimButton.h"
#import "LTSScaleLayer.h"
#import "LTSCircleLayer.h"
#import "LTSAnimParams.h"

@interface LTSAnimButton()

@property (strong, nonatomic) LTSScaleLayer *scaleLayer;

@property (strong, nonatomic) LTSCircleLayer *circleLayer;

@property (strong, nonatomic) LTSAnimParams *animParams;

@end

@implementation LTSAnimButton

-(instancetype)init:(LTSAnimParams *)animParams{
    self = [super init];
    if (self) {
        self.animParams = animParams;
        [self initLayers];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder animParams:(LTSAnimParams *)animParams{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.animParams = animParams;
        [self initLayers];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame animParams:(LTSAnimParams *)animParams{
    self = [super initWithFrame:frame];
    if (self) {
        self.animParams = animParams;
        [self initLayers];
    }
    return self;
}

-(void)initLayers{
    self.scaleLayer = [[LTSScaleLayer alloc]init:self.animParams];
    self.circleLayer = [[LTSCircleLayer alloc]init:self.animParams];
    self.scaleLayer.frame = self.bounds;
    self.circleLayer.frame = self.bounds;
    [self.layer addSublayer:self.scaleLayer];
    [self.layer addSublayer:self.circleLayer];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    if (!self.animParams.clicked) {
        [self.scaleLayer startAnim];
        [self.circleLayer startAnim];
        self.animParams.clicked = !self.animParams.clicked;
    }else{
        self.animParams.clicked = !self.animParams.clicked;
    }
    [self.scaleLayer btnShowStatus];
}

@end
