//
//  ViewController.m
//  FlutterHybridDemo
//
//  Created by zengjing on 2018/11/25.
//  Copyright © 2018年 devzeng.com. All rights reserved.
//

#import "ExampleHomeViewController.h"
#import "AppDelegate.h"
#import <Masonry/Masonry.h>

@interface ExampleHomeViewController ()

@end

@implementation ExampleHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Flutter Hybrid Demo";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"打开Flutter示例页面" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(24);
        make.height.equalTo(@(50));
    }];
}

- (void)clickAction:(id)sender {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self.navigationController pushViewController:delegate.pluginAppDelegate.rootController animated:YES];
}

@end
