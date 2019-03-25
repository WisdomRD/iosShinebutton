//
//  LTSAnimButton.h
//  LTS
//
//  Created by Fangjw on 2018/4/3.
//  Copyright © 2018年 LTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTSAnimParams;

@interface LTSAnimButton : UIButton

-(instancetype)init:(LTSAnimParams *)animParams;

-(instancetype)initWithCoder:(NSCoder *)aDecoder animParams:(LTSAnimParams *)animParams;

-(instancetype)initWithFrame:(CGRect)frame animParams:(LTSAnimParams *)animParams;

@end
