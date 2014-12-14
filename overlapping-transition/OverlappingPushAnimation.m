//
//  OverlappingPushAnimation.m
//  overlapping-transition
//
//  Created by Diego Maehler on 13/12/14.
//  Copyright (c) 2014 Diego Maehler. All rights reserved.
//

#import "OverlappingPushAnimation.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation OverlappingPushAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 2.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect fromFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
    
    fromVC.view.layer.anchorPoint = CGPointMake(0.5, 0);
    toVC.view.layer.anchorPoint = CGPointMake(0.5, 1);
    
    fromVC.view.frame = fromFrame;
    toVC.view.frame = toFrame;
    
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0/500;
    t = CATransform3DRotate(t, DEGREES_TO_RADIANS(-60), 1, 0, 0);
    toVC.view.layer.transform = t;

    [[transitionContext containerView] addSubview:toVC.view];
    [[transitionContext containerView] sendSubviewToBack:toVC.view];
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionLayoutSubviews
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:0.4
                                                                animations:^{
                                                                    CATransform3D t = CATransform3DIdentity;
                                                                    t.m34 = 1.0/500;
                                                                    t = CATransform3DRotate(t, DEGREES_TO_RADIANS(60), 1, 0, 0);
                                                                    fromVC.view.layer.transform = t;
                                                                }];
                                  [UIView addKeyframeWithRelativeStartTime:0.5
                                                          relativeDuration:0.4
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
