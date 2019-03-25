//
//  LTSCircleLayer.h
//  LTS
//
//  Created by Fangjw on 2018/4/3.
//  Copyright © 2018年 LTS. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class LTSAnimParams;

@interface LTSCircleLayer : CALayer

-(instancetype)init:(LTSAnimParams *)animParams;

-(void)startAnim;

@end
