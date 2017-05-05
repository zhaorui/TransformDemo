//
//  DemoView.m
//  ca
//
//  Created by 赵睿 on 05/05/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

#import "DemoView.h"

@implementation DemoView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    //draw frame
    [[[NSColor yellowColor] colorWithAlphaComponent:0.3] setFill];
    NSBezierPath *framePath = [NSBezierPath bezierPathWithRect:dirtyRect];
    [framePath setLineWidth:2.0];
    [framePath fill];
    
}

-(void)viewDidMoveToWindow {
    self.layer.borderColor = [[NSColor redColor] CGColor];
    self.layer.borderWidth = 2.0;
}

-(void)setAnchorPoint:(CGPoint)anchorPoint {
    if (self.layer.anchorPoint.x == anchorPoint.x &&
        self.layer.anchorPoint.y == anchorPoint.y) {
        return;
    }
    CGRect oldFrame = self.layer.frame;
    //NSLog(@"before : %@", NSStringFromRect(self.layer.frame));
    self.layer.anchorPoint = anchorPoint;
    //NSLog(@"after : %@", NSStringFromRect(self.layer.frame));
    self.layer.frame = oldFrame;
}


-(NSView *)hitTest:(NSPoint)point {
    //revert the point to see if veiw's in the frame rect
    const float angle = [[self.layer valueForKeyPath:@"transform.rotation"] floatValue];
    const float scale_x = [[self.layer valueForKeyPath:@"transform.scale.x"] floatValue];
    NSLog(@"point:%@ angle: %f, scale: %f", NSStringFromPoint(point), angle, scale_x);
    
    //revert point to frame
    //1. to the anchor point coordinate
    NSPoint a_point;
    a_point.x = point.x - self.layer.position.x;
    a_point.y = point.y - self.layer.position.y;
    
    //2. revert rotation
    a_point.x = a_point.x * cosf(-angle) - a_point.y * sinf(-angle);
    a_point.y = a_point.y * cosf(-angle) + a_point.x * sinf(-angle);
    
    //3. revert scale
    a_point.x /= scale_x;
    a_point.y /= scale_x;
    
    //4. revert back to window coordinate
    a_point.x += self.layer.position.x;
    a_point.y += self.layer.position.y;
    
    if (NSPointInRect(a_point, self.frame)) {
        NSLog(@"click layer");
        return self;
    } else {
        NSLog(@"not clicked");
        return nil;
    }
    
}

@end
