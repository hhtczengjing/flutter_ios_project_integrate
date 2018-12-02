//
//  DemoFlutterPluginAppDelegate.h
//  FlutterHybridDemo
//
//  Created by zengjing on 2018/11/25.
//  Copyright © 2018年 devzeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FlutterContainerViewController.h"

@interface DemoFlutterPluginAppDelegate : NSObject<FlutterPluginRegistry>

@property (nonatomic, strong) FlutterContainerViewController *rootController;
@property (nonatomic, strong, readonly) NSMutableArray *pluginDelegates;
@property (nonatomic, strong, readonly) NSMutableDictionary* pluginPublications;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
