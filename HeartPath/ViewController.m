//
//  ViewController.m
//  HeartPath
//
//  Created by MX007 on 16/8/16.
//  Copyright © 2016年 zhangfaxing. All rights reserved.
//

#import "ViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define startX  ScreenWidth/6.0

#define centerX ScreenWidth/2

#define Y ScreenHeight/2

@interface ViewController ()<UIApplicationDelegate,CAAnimationDelegate>
{
    CAShapeLayer *shapeLayer;
    CAShapeLayer *shapeLayer2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //模糊效果
    UIBlurEffect *light = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *lightView = [[UIVisualEffectView alloc]initWithEffect:light];
    lightView.frame = self.view.bounds;
    [self.view addSubview:lightView];

    
    [self TheFirstAnimation];
}


- (void)TheFirstAnimation
{
    
    UIBezierPath *_path;
    
    //贝塞尔曲线,以下是4个角的位置，相对于_testView1
    CGPoint point1= CGPointMake(0, Y);
    CGPoint point2= CGPointMake(startX, Y);
    CGPoint point3= CGPointMake(startX+5, Y-20);
    CGPoint point4= CGPointMake(startX+10, Y+20);
    CGPoint point5= CGPointMake(startX+15, Y);
    CGPoint point6= CGPointMake(startX+25, Y-50);
    CGPoint point7= CGPointMake(startX+35, Y+50);
    CGPoint point8= CGPointMake(startX+40, Y+10);
    CGPoint point9= CGPointMake(startX+45, Y+10);
    CGPoint point10= CGPointMake(startX+50, Y-10);
    CGPoint point11= CGPointMake(startX+55, Y);
    CGPoint point12= CGPointMake(centerX-2, Y);

    CGPoint point0= CGPointMake(ScreenWidth, Y);
    
    _path=[UIBezierPath bezierPath];
    [_path moveToPoint:point1];//移动到某个点，也就是起始点
    [_path addLineToPoint:point2];
    [_path addLineToPoint:point3];
    [_path addLineToPoint:point4];
    [_path addLineToPoint:point5];
    [_path addLineToPoint:point6];
    [_path addLineToPoint:point7];
    [_path addLineToPoint:point8];
    [_path addLineToPoint:point9];
    [_path addLineToPoint:point10];
    [_path addLineToPoint:point11];
    [_path addLineToPoint:point12];

    //绘制曲线
    [_path addQuadCurveToPoint:CGPointMake(centerX, Y-100) controlPoint:CGPointMake(startX+20, Y-130)];
    [_path addQuadCurveToPoint:CGPointMake(centerX+2, Y) controlPoint:CGPointMake(centerX+centerX-startX-20, Y-130)];
    
    [_path addLineToPoint:point0];
    
    //controlPoint控制点，不等于曲线顶点
    //[_path addQuadCurveToPoint:point1 controlPoint:CGPointMake(150, -30)];
    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.path=_path.CGPath;
    shapeLayer.fillColor=[UIColor clearColor].CGColor;//填充颜色
    shapeLayer.strokeColor=[UIColor redColor].CGColor;//边框颜色
    [self.view.layer addSublayer:shapeLayer];
    
    //1122334454555
    //动画
    CABasicAnimation *pathAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    // 时间
    pathAniamtion.duration = 3;
    //动画节奏
    pathAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAniamtion.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAniamtion.toValue = [NSNumber numberWithFloat:1.0];
//    pathAniamtion.autoreverses = YES; //动画逆方向
    pathAniamtion.delegate = self;
//    [shapeLayer addAnimation:pathAniamtion forKey:@"animation1"];
    
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [shapeLayer removeFromSuperlayer];
    
    [self TheFirstAnimation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
