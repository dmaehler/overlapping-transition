//
//  ViewController.m
//  overlapping-transition
//
//  Created by Diego Maehler on 13/12/14.
//  Copyright (c) 2014 Diego Maehler. All rights reserved.
//

#import "ViewController.h"
#import "AnotherViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"View Controller 1";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openAnotherView:(id)sender {
    AnotherViewController *anotherVC = [[AnotherViewController alloc] initWithNibName:@"AnotherView"
                                                                               bundle:nil];
    [self.navigationController pushViewController:anotherVC animated:YES];
    
}

@end
