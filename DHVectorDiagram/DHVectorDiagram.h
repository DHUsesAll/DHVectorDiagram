//
//  DHVectorDiagram.h
//  LunarLander
//
//  Created by DreamHack on 16-4-14.
//  Copyright (c) 2016年 DreamHack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DHVectorDiagram : NSObject

@property (nonatomic, strong) NSArray * vertexBuffers;

@property (nonatomic, strong) UIColor * strokeColor;

@property (nonatomic, assign) CGFloat unitLength;

@property (nonatomic, strong, readonly) NSMutableArray * worldVertexBuffers;

- (instancetype)initWithVertexBuffers:(NSArray *)vertexBuffers;

- (void)renderInContext:(CGContextRef)context;

@end

// 旋转平移缩放
@interface DHVectorDiagram (Transform)

// 平移
- (void)translateWithDeltaX:(CGFloat)dx deltaY:(CGFloat)dy;
// 缩放
- (void)scaleWithScalingFactorX:(CGFloat)sx scalingFactorY:(CGFloat)sy;
// 旋转
- (void)rotateWithRadian:(CGFloat)radian;

@end


@interface DHVectorDiagram (SepciallizedGraphs)

/**
 *  直接构造一个等边三角形矢量图
 *
 *  @param length 等边三角形的边长
 *
 *  @return 等边三角形
 */
+ (instancetype)equilateralTriangleWithLength:(CGFloat)length;

/**
 *  直接构造一个正方形矢量图
 *
 *  @param length 正方形的边长
 *
 *  @return 正方形
 */
+ (instancetype)squareWithLength:(CGFloat)length;

/**
 *  直接构造一个五角星矢量图
 *
 *  @param length 五角星边长
 *
 *  @return 五角星
 */
+ (instancetype)pentastarWithLength:(CGFloat)length;

/**
 *  直接构造一个矩形矢量图
 *
 *  @param size 矩形的长和宽
 *
 *  @return 矩形
 */
+ (instancetype)rectangleWithSize:(CGSize)size;

/**
 *  直接构造一个平行四边形矢量图
 *
 *  @param size   平行四边形的两组对边的长度（width是底边长，height是斜边长）
 *  @param radian 一个底角的大小（左下角那个）
 *
 *  @return 平行四边形
 */
+ (instancetype)parallelogramWithSize:(CGSize)size cornerRadian:(CGFloat)radian;




@end