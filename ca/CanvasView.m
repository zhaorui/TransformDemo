//
//  CanvasView.m
//  ca
//
//  Created by 赵睿 on 05/05/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

#import "CanvasView.h"

static CGFloat dotRadius = 2;

@implementation CanvasView

-(void)setTarget_layer_frame:(NSRect)target_layer_frame {
    _target_layer_frame = target_layer_frame;
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawin target frame here
    [[[NSColor grayColor] colorWithAlphaComponent:0.5] set];
    NSRectFill(self.target_frame);
    
    // Drawing layer frame here.
    [[NSColor blackColor] setStroke];
    NSRect biggerRect = CGRectInset(self.target_layer_frame, -2, -2);
    NSBezierPath *layerFramePath = [NSBezierPath bezierPathWithRect:biggerRect];
    [layerFramePath setLineWidth:1];
    [layerFramePath stroke];
    
    // Drawing layer anchor point here.
    [[NSColor greenColor] set];
    NSRect dotRect =  NSMakeRect(self.target_layer_anchor_position.x - dotRadius ,
               self.target_layer_anchor_position.y - dotRadius,
               2 * dotRadius, 2 * dotRadius);
    NSRectFill(dotRect);

}

@end
