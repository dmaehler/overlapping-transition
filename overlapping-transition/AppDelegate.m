//
//  AppDelegate.m
//  overlapping-transition
//
//  Created by Diego Maehler on 13/12/14.
//  Copyright (c) 2014 Diego Maehler. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "OverlappingTransitionDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
    ViewController *viewController = [[ViewController alloc] initWithNibName:@"View" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    //Sets the OverlappingDelegate to the navigationController delegate
    self.overlappingDelegate = [[OverlappingTransitionDelegate alloc] init];
    navigationController.delegate = self.overlappingDelegate;
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
