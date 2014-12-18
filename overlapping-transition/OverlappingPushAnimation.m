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
    return 1.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //Get frames for the two Views
    CGRect fromFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
    
    //Set anchor points to animate the toVC from bottom and fromVC from top
    fromVC.view.layer.anchorPoint = CGPointMake(0.5, 0);
    toVC.view.layer.anchorPoint = CGPointMake(0.5, 1);
    
    //Sets back the frames for correctly the anchor points
    fromVC.view.frame = fromFrame;
    toVC.view.frame = toFrame;
    
    //Start the toVC's view from laying down behind the scene
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0/500;
    t = CATransform3DRotate(t, DEGREES_TO_RADIANS(-90), 1, 0, 0);
    toVC.view.layer.transform = t;

    [[transitionContext containerView] addSubview:toVC.view];
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionLayoutSubviews
                              animations:^{
                                  //Animate the fromVC rotating it to up backward
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:0.6
                                                                animations:^{
                                                                    CATransform3D t = CATransform3DIdentity;
                                                                    t.m34 = 1.0/500;
                                                                    t = CATransform3DRotate(t, DEGREES_TO_RADIANS(90), 1, 0, 0);
                                                                    fromVC.view.layer.transform = t;
                                                                }];
                                  //Animate the toVC from down to the front of scene
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
