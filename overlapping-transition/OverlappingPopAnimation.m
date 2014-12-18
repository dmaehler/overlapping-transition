//
//  OverlappingPopAnimation.m
//  overlapping-transition
//
//  Created by Diego Maehler on 13/12/14.
//  Copyright (c) 2014 Diego Maehler. All rights reserved.
//

#import "OverlappingPopAnimation.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation OverlappingPopAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionLayoutSubviews
                              animations:^{
                                  //Animate the current view to the behind scene rotating it 'till lay it down
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:0.6
                                                                animations:^{
                                                                    CATransform3D t = CATransform3DIdentity;
                                                                    t.m34 = 1.0/500;
                                                                    t = CATransform3DRotate(t,DEGREES_TO_RADIANS(-90), 1, 0, 0);
                                                                    fromVC.view.layer.transform = t;
                                                                }];
                                  //Animate back downward the up view
                                  [UIView addKeyframeWithRelativeStartTime:0.4
                                                          relativeDuration:0.6
                                                                animations:^{
                                                                    CATransform3D t = CATransform3DIdentity;
                                                                    t.m34 = 1.0/500;
                                                                    t = CATransform3DRotate(t, DEGREES_TO_RADIANS(0), 1, 0, 0);
                                                                    toVC.view.layer.transform = t;
                                                                }];
                              }
                              completion:^(BOOL finished) {
                                  [transitionContext completeTransition:YES];
                              }];
    
}

@end
