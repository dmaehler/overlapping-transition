//
//  ViewController.m
//  overlapping-transition
//
//  Created by Diego Maehler on 13/12/14.
//  Copyright (c) 2014 Diego Maehler. All rights reserved.
//

#import "ViewController.h"
#import "AnotherViewController.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"View Controller 1";
    // Do any additional setup after loading the view, typically from a nib.
    
    self.blockView = [[UIView alloc] init];
    //
    self.blockView.frame = CGRectMake(60, 60, 100, 200);
    self.blockView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.blockView];
    
    
    self.bounds = self.view.frame;
    self.view.layer.anchorPoint = CGPointMake(0.5, 0);
    self.view.frame = self.bounds;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)openAnotherView:(id)sender {
    AnotherViewController *anotherVC = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
  [self.navigationController pushViewController:anotherVC animated:YES];
    
//    [UIView animateKeyframesWithDuration:3.8f
//                                   delay:0.0
//                                 options:0
//                              animations:^{
//                                  [UIView addKeyframeWithRelativeStartTime:0.0
//                                                          relativeDuration:0.4
//                                                                animations:^{
//                                                                    CATransform3D t = CATransform3DIdentity;
//                                                                    t.m34 = 1.0 / 500;
//                                                                    t = CATransform3DRotate(t, DEGREES_TO_RADIANS(60), 1, 0, 0);
//                                                                    self.view.layer.transform = t;
//                                                                }];
//                                  [UIView addKeyframeWithRelativeStartTime:0.5
//                                                          relativeDuration:0.5
//                                                                animations:^{
//                                                                    CATransform3D t = CATransform3DIdentity;
//                                                                    t.m34 = 1.0 / 500;
//                                                                    t = CATransform3DRotate(t, DEGREES_TO_RADIANS(0), 1, 0, 0);
//                                                                    self.view.layer.transform = t;
//                                                                }];
//                              }
//                              completion:^(BOOL finished) {
////                                  self.view.frame = self.bounds;
//                              }];
  
}

@end
