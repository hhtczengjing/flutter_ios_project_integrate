//
//  AppDelegate.m
//  FlutterHybridDemo
//
//  Created by zengjing on 2018/11/25.
//  Copyright © 2018年 devzeng.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ExampleHomeViewController.h"
#import <MGJRouter/MGJRouter.h>
#import "DemoFlutterPluginAppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 注册插件
    [self.pluginAppDelegate application:application didFinishLaunchingWithOptions:launchOptions];
    
    ExampleHomeViewController *controller = [[ExampleHomeViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window.rootViewController = navi;
    
    [self.window makeKeyAndVisible];
    
    [self registerURLHandler];
    
    return YES;
}

- (void)registerURLHandler {
    [MGJRouter registerURLPattern:@"com.devzeng.demo://version?type=:type" toObjectHandler:^id(NSDictionary *routerParameters) {
        NSString *type = routerParameters[@"type"];
        if([type isEqualToString:@"1"]) {
            NSString *v = [UIDevice currentDevice].systemVersion ? : @"";
            return @{@"version": v};
        }
        else if([type isEqualToString:@"2"]) {
            NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
            NSString *v = [info objectForKey:@"CFBundleShortVersionString"] ? : @"";
            NSString *b = [info objectForKey:@"CFBundleVersion"] ? : @"";
            return @{@"version": v, @"build": b};
        }
        return @{};
    }];
    
    [MGJRouter registerURLPattern:@"com.devzeng.demo://goback" toHandler:^(NSDictionary *routerParameters) {
        UIViewController *controller = self.pluginAppDelegate.rootController;
        [controller.navigationController popViewControllerAnimated:YES];
    }];
}

- (DemoFlutterPluginAppDelegate *)pluginAppDelegate {
    if(!_pluginAppDelegate) {
        _pluginAppDelegate = [DemoFlutterPluginAppDelegate new];
    }
    return _pluginAppDelegate;
}

@end
