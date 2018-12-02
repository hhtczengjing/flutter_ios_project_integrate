//
//  DemoFlutterPluginAppDelegate.m
//  FlutterHybridDemo
//
//  Created by zengjing on 2018/11/25.
//  Copyright © 2018年 devzeng.com. All rights reserved.
//

#import "DemoFlutterPluginAppDelegate.h"
#import "DemoFlutterPluginRegistrar.h"
#import <flutter_hybrid_router/FlutterHybridRouterPlugin.h>

@interface DemoFlutterPluginAppDelegate ()

@end

@implementation DemoFlutterPluginAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 注册插件
    [FlutterHybridRouterPlugin registerWithRegistrar:[self registrarForPlugin:@"FlutterHybridRouterPlugin"]];
    
    // 向每个插件发送消息
    for (id<FlutterPlugin> plugin in _pluginDelegates) {
        if ([plugin respondsToSelector:_cmd]) {
            [plugin application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    
    return YES;
}

- (NSObject<FlutterPluginRegistrar> *)registrarForPlugin:(NSString *)pluginKey {
    NSAssert(self.pluginPublications[pluginKey] == nil, @"Duplicate plugin key: %@", pluginKey);
    self.pluginPublications[pluginKey] = [NSNull null];
    return [[DemoFlutterPluginRegistrar alloc] initWithPlugin:pluginKey appDelegate:self];
}

- (BOOL)hasPlugin:(nonnull NSString *)pluginKey {
    return _pluginPublications[pluginKey] != nil;
}

- (nonnull NSObject *)valuePublishedByPlugin:(nonnull NSString *)pluginKey {
    return _pluginPublications[pluginKey];
}

- (FlutterViewController *)rootController {
    if(!_rootController) {
        _rootController = [[FlutterContainerViewController alloc] init];
    }
    return _rootController;
}

@end
