//
//  CanvasView.h
//  ca
//
//  Created by 赵睿 on 05/05/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CanvasView : NSView

@property (nonatomic) NSRect target_frame;
@property (nonatomic) NSRect target_layer_frame;
@property (nonatomic) NSPoint target_layer_anchor_position;

@end
