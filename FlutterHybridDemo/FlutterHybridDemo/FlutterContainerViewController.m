//
//  FlutterContainerViewController.m
//  FlutterHybridDemo
//
//  Created by zengjing on 2018/11/25.
//  Copyright © 2018年 devzeng.com. All rights reserved.
//

#import "FlutterContainerViewController.h"
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>

@interface FlutterContainerViewController ()

@end

@implementation FlutterContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (BOOL)fd_prefersNavigationBarHidden {
    return YES;
}

@end
