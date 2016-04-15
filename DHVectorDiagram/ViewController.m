//
//  ViewController.m
//  DHVectorDiagram
//
//  Created by DreamHack on 16-4-15.
//  Copyright (c) 2016年 DreamHack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登月工程";
    
    NSValue * point1 = [NSValue valueWithCGPoint:CGPointMake(-1, -2)];
    NSValue * point2 = [NSValue valueWithCGPoint:CGPointMake(1, -2)];
    NSValue * point3 = [NSValue valueWithCGPoint:CGPointMake(1, -1)];
    NSValue * point4 = [NSValue valueWithCGPoint:CGPointMake(2, -1)];
    NSValue * point5 = [NSValue valueWithCGPoint:CGPointMake(2, 1)];
    NSValue * point6 = [NSValue valueWithCGPoint:CGPointMake(-2, 1)];
    NSValue * point7 = [NSValue valueWithCGPoint:CGPointMake(-2, -1)];
    NSValue * point8 = [NSValue valueWithCGPoint:CGPointMake(-1, -1)];
    
    NSArray * points = @[point1,point2,point3,point4,point5,point6,point7,point8];

    DHVectorDiagram * vectorDiagram = [[DHVectorDiagram alloc] initWithVertexBuffers:points];
    vectorDiagram.unitLength = 50;
    
    [vectorDiagram translateWithDeltaX:3 deltaY:5];
    [vectorDiagram rotateWithRadian:M_PI_2];
    [vectorDiagram scaleWithScalingFactorX:1 scalingFactorY:2];
    
//    [vectorDiagram translateWithDeltaX:0 deltaY:1];
    [vectorDiagram rotateWithRadian:M_PI_4];
    [vectorDiagram scaleWithScalingFactorX:2 scalingFactorY:1];
    
    DHVectorDiagramView * view = [[DHVectorDiagramView alloc] initWithFrame:self.view.bounds vectorDiagram:vectorDiagram];
    [self.view addSubview:view];
    
}

@end
