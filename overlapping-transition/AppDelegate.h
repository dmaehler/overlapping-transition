//
//  AppDelegate.h
//  overlapping-transition
//
//  Created by Diego Maehler on 13/12/14.
//  Copyright (c) 2014 Diego Maehler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverlappingTransitionDelegate.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) OverlappingTransitionDelegate *overlappingDelegate;

@end

