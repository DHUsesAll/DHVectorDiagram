//
//  DHVectorDiagram.m
//  LunarLander
//
//  Created by DreamHack on 16-4-14.
//  Copyright (c) 2016年 DreamHack. All rights reserved.
//

#import "DHVectorDiagram.h"
#import "DHMatrix.h"

@interface DHVectorDiagram ()

@property (nonatomic, assign) NSInteger vertexCount;
@property (nonatomic, strong) NSMutableArray * worldVertexBuffers;
@property (nonatomic, assign) CGPoint worldCenter;

// 变换矩阵，最终的顶点计算将乘以变换矩阵
// 变换矩阵 = 当前所有应用的平移、缩放、旋转矩阵相乘
@property (nonatomic, assign) DHMatrix transformMatrix;

- (void)_updateVertexBuffers;
- (CGPoint)_translatePoint:(CGPoint)point withVector:(CGPoint)vector;

@end

@implementation DHVectorDiagram

- (instancetype)initWithVertexBuffers:(NSArray *)vertexBuffers
{
    self = [super init];
    if (self) {
        self.vertexBuffers = vertexBuffers;
        self.unitLength = 1;
    }
    return self;
}

- (void)renderInContext:(CGContextRef)context
{
    CGColorRef strokeColor = [UIColor blackColor].CGColor;
    if (self.strokeColor) {
        strokeColor = self.strokeColor.CGColor;
    }
    CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor);
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGPoint firstPoint = [self.worldVertexBuffers.firstObject CGPointValue];
    
    CGContextMoveToPoint(context, firstPoint.x * self.unitLength, firstPoint.y * self.unitLength);
    
    for (int i = 1; i < self.vertexBuffers.count; ++i) {
        CGPoint point = [self.worldVertexBuffers[i] CGPointValue];
        CGContextAddLineToPoint(context, point.x * self.unitLength, point.y * self.unitLength);
    }
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

#pragma mark - private methods
- (void)_updateVertexBuffers
{
    NSMutableArray * vertexBuffers = [NSMutableArray arrayWithCapacity:0];
    [self.vertexBuffers enumerateObjectsUsingBlock:^(NSValue *  obj, NSUInteger idx, BOOL *stop) {
        
        CGPoint point = [obj CGPointValue];
        point = [self _translatePoint:point withVector:self.worldCenter];
        [vertexBuffers addObject:[NSValue valueWithCGPoint:point]];
        
    }];
    
    self.worldVertexBuffers = [vertexBuffers copy];
}

- (CGPoint)_translatePoint:(CGPoint)point withVector:(CGPoint)vector
{
    return CGPointMake(point.x + vector.x, point.y + vector.y);
}

#pragma mark - setter

@end


@implementation DHVectorDiagram (Transform)

- (void)translateWithDeltaX:(CGFloat)dx deltaY:(CGFloat)dy
{
    self.worldCenter = [self _translatePoint:self.worldCenter withVector:CGPointMake(dx, dy)];
    [self _updateVertexBuffers];
}

- (void)scaleWithScalingFactorX:(CGFloat)sx scalingFactorY:(CGFloat)sy
{
    NSMutableArray * transformArray = [NSMutableArray arrayWithCapacity:0];
    [self.vertexBuffers enumerateObjectsUsingBlock:^(NSValue * obj, NSUInteger idx, BOOL *stop) {
        
        CGPoint point = [obj CGPointValue];
        DHMatrix matrix = DHMatrixScalePoint(point, sx, sy);
        
        [transformArray addObject:[NSValue valueWithCGPoint:DHMatrixToCGPoint(matrix)]];
    }];
    self.vertexBuffers = transformArray;
    [self _updateVertexBuffers];
}

- (void)rotateWithRadian:(CGFloat)radian
{
    NSMutableArray * transformArray = [NSMutableArray arrayWithCapacity:0];
    [self.vertexBuffers enumerateObjectsUsingBlock:^(NSValue * obj, NSUInteger idx, BOOL *stop) {
        
        CGPoint point = [obj CGPointValue];
        DHMatrix matrix = DHMatrixRotatePoint(point, radian);
        [transformArray addObject:[NSValue valueWithCGPoint:DHMatrixToCGPoint(matrix)]];
    }];
    self.vertexBuffers = transformArray;
    [self _updateVertexBuffers];
}

@end
