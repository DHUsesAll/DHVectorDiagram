//
//  DHVectorDiagramView.m
//  LunarLander
//
//  Created by DreamHack on 16-4-15.
//  Copyright (c) 2016年 DreamHack. All rights reserved.
//

#import "DHVectorDiagramView.h"

@interface DHVectorDiagramView ()

@property (nonatomic, strong) DHVectorDiagram * vectorDiagram;

@end

@implementation DHVectorDiagramView

- (instancetype)initWithFrame:(CGRect)frame vectorDiagram:(DHVectorDiagram *)vectorDiagram
{
    self = [super initWithFrame:frame];
    if (self) {
        self.vectorDiagram = vectorDiagram;
        self.backgroundColor = [UIColor clearColor];
        [self setNeedsDisplay];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.vectorDiagram renderInContext:context];
}

@end
