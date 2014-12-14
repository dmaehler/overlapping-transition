//
//  ViewController.h
//  overlapping-transition
//
//  Created by Diego Maehler on 13/12/14.
//  Copyright (c) 2014 Diego Maehler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

- (IBAction)openAnotherView:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) UIView *blockView;
@property (nonatomic) BOOL rotated;
@property (nonatomic) CGRect bounds;

@end

