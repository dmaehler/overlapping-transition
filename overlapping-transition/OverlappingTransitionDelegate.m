//
//  OverlappingTransitionDelegate.m
//  overlapping-transition
//
//  Created by Diego Maehler on 13/12/14.
//  Copyright (c) 2014 Diego Maehler. All rights reserved.
//

#import "OverlappingTransitionDelegate.h"
#import "OverlappingPopAnimation.h"
#import "OverlappingPushAnimation.h"

@implementation OverlappingTransitionDelegate


- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [[OverlappingPushAnimation alloc] init];
    } else if (operation == UINavigationControllerOperationPop) {
        return [[OverlappingPopAnimation alloc] init];
    }
    
    return nil;
}

@end
