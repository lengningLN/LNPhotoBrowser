//
//  LNLoadingView.m
//  LNPhotoBrower
//
//  Created by 刘宁 on 2018/8/16.
//  Copyright © 2018年 刘宁. All rights reserved.
//

#import "LNLoadingView.h"

@interface LNLoadingView()
@property (nonatomic, weak) CALayer *cycleLayer;;
@end

@implementation LNLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        CGFloat radius = 14;
        CGFloat lineWidth = 4;
        CGFloat wh = (radius + lineWidth) * 2;
        CAShapeLayer *cycleBgL = [[CAShapeLayer alloc] init];
        cycleBgL.bounds = CGRectMake(0, 0, wh, wh);
        cycleBgL.position = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(wh * 0.5, wh * 0.5) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
        [cycleBgL setPath:path.CGPath];
        [cycleBgL setLineWidth:lineWidth];
        [cycleBgL setFillColor:[UIColor clearColor].CGColor];
        [cycleBgL setStrokeColor:[[UIColor blackColor] colorWithAlphaComponent:0.6].CGColor];
        cycleBgL.path = path.CGPath;
        [self.layer addSublayer:cycleBgL];
        
        CAShapeLayer *cycleL = [[CAShapeLayer alloc] init];
        cycleL.bounds = CGRectMake(0, 0, wh, wh);
        cycleL.position = CGPointMake(wh * 0.5, wh * 0.5);
        UIBezierPath *cyclePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(wh * 0.5, wh * 0.5) radius:radius startAngle:0 endAngle:(M_PI * 2.0 / 3.0) clockwise:YES];
        [cycleL setPath:cyclePath.CGPath];
        [cycleL setLineCap:kCALineCapRound];
        [cycleL setLineWidth:lineWidth];
        [cycleL setStrokeColor:[UIColor whiteColor].CGColor];
        [cycleL setFillColor:[UIColor clearColor].CGColor];
        [cycleBgL addSublayer:cycleL];
        _cycleLayer = cycleL;
    }
    return self;
}

- (void)setLoading:(BOOL)loading
{
    _loading = loading;
    
    if (loading) {
        [self setHidden:NO];
        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = @"transform.rotation.z";
        animation.fromValue = @0;
        animation.toValue = @(2*M_PI);
        animation.duration = 1;
        animation.repeatCount = HUGE_VALF;
        
        
        // 动画终了后不返回初始状态
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [_cycleLayer addAnimation:animation forKey:@"loading"];
    }else{
        [self setHidden:YES];
        [_cycleLayer removeAnimationForKey:@"loading"];
    }
    
}
@end
