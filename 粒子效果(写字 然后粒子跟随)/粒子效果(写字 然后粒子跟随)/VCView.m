//
//  VCView.m
//  粒子效果(写字 然后粒子跟随)
//
//  Created by 万艳勇 on 2017/10/17.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import "VCView.h"


@interface VCView()

/**
 当前路径
 */

@property (nonatomic, strong) UIBezierPath *path;
/**
当前粒子
 */
@property (nonatomic, strong) CALayer *dotLayer;

@end


@implementation VCView


+ (Class)layerClass{
    return [CAReplicatorLayer class];
}


- (void)awakeFromNib{
    [super awakeFromNib];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    // 添加粒子
    CALayer *dotLayer = [CALayer layer];
    dotLayer.frame = CGRectMake(-20, 0, 10, 10);
    dotLayer.backgroundColor = [UIColor redColor].CGColor;
    self.dotLayer = dotLayer;
    [self.layer addSublayer:dotLayer];
    
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.layer;
    repL.instanceCount = 30;
    // 设置动画延时时长
    repL.instanceDelay = 0.5;
    
    // 设置路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;
    
}


- (void)pan:(UIPanGestureRecognizer *)pan{
    //获取当前点
    CGPoint curPonit = [pan locationInView:self];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        [self.path moveToPoint:curPonit];
    }else if (pan.state == UIGestureRecognizerStateChanged){
        // 添加一根线到当前点
        [self.path addLineToPoint:curPonit];
        // 重绘
        [self setNeedsDisplay];
    }
}
// 开始
- (void)start{
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.keyPath = @"position";
    keyFrameAnimation.path = self.path.CGPath;
    keyFrameAnimation.repeatCount = MAXFLOAT;
    keyFrameAnimation.duration = 5;
    [self.dotLayer addAnimation:keyFrameAnimation forKey:nil];
}
// 重绘
- (void)redraw{
    // 删除动画
    [self.dotLayer removeAllAnimations];
    // 删除路径
    [self.path removeAllPoints];
    // 重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // 绘制路径
    [self.path stroke];
}


@end



























