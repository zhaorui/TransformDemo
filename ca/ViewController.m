//
//  ViewController.m
//  ca
//
//  Created by 赵睿 on 05/05/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

#import "ViewController.h"
#import "CanvasView.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.demo_view.layer.transform = CATransform3DIdentity;
    //[self.demo_view.layer setValue:@1.0 forKeyPath:@"transform.scale.x"];
    //[self.demo_view.layer setValue:@1.0 forKeyPath:@"transform.scale.y"];
    [self updateCanvas];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)clockwiseRotate:(NSButton *)sender {
    [self.demo_view setAnchorPoint:NSMakePoint(0.5, 0.5)];
    self.demo_view.layer.transform = CATransform3DRotate(self.demo_view.layer.transform, -M_PI/6, 0, 0, 1);
    [self updateCanvas];
}

- (IBAction)counterClockwiseRotate:(NSButton *)sender {
    [self.demo_view setAnchorPoint:NSMakePoint(0.5, 0.5)];
    self.demo_view.layer.transform = CATransform3DRotate(self.demo_view.layer.transform, M_PI/6, 0, 0, 1);
    [self updateCanvas];
}
- (IBAction)zoomin:(NSButton *)sender {
    [self.demo_view setAnchorPoint:NSMakePoint(0.5, 0.5)];
    
//    NSLog(@"scale x:%@ y:%@ z:%@ total:%@", [self.demo_view.layer valueForKeyPath:@"transform.scale.x"],
//          [self.demo_view.layer valueForKeyPath:@"transform.scale.y"],
//          [self.demo_view.layer valueForKeyPath:@"transform.scale.z"],
//          [self.demo_view.layer valueForKeyPath:@"transform.scale"]);
    
    self.demo_view.layer.transform = CATransform3DScale(self.demo_view.layer.transform,
                                                        1.1, 1.1, 1);
    [self updateCanvas];
}

- (IBAction)zoomout:(NSButton *)sender {
    [self.demo_view setAnchorPoint:NSMakePoint(0.5, 0.5)];
    
//    NSLog(@"scale x:%@ y:%@ z:%@ total:%@", [self.demo_view.layer valueForKeyPath:@"transform.scale.x"],
//          [self.demo_view.layer valueForKeyPath:@"transform.scale.y"],
//          [self.demo_view.layer valueForKeyPath:@"transform.scale.z"],
//          [self.demo_view.layer valueForKeyPath:@"transform.scale"]);
    
    self.demo_view.layer.transform = CATransform3DScale(self.demo_view.layer.transform,
                                                        0.9, 0.9, 1);
    [self updateCanvas];
}
- (IBAction)invert:(NSButton *)sender {
    self.demo_view.layer.transform = CATransform3DInvert(self.demo_view.layer.transform);
    [self updateCanvas];
}

-(void)updateCanvas {
    CanvasView * canvas = (CanvasView*)self.view;
    [canvas setTarget_frame:self.demo_view.frame];
    [canvas setTarget_layer_frame:self.demo_view.layer.frame];
    [canvas setTarget_layer_anchor_position:self.demo_view.layer.position];
}



@end
