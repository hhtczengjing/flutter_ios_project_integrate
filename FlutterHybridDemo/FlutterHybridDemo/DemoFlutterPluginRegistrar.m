//
//  DemoFlutterPluginRegistrar.m
//  FlutterHybridDemo
//
//  Created by zengjing on 2018/11/25.
//  Copyright © 2018年 devzeng.com. All rights reserved.
//

#import "DemoFlutterPluginRegistrar.h"

@implementation DemoFlutterPluginRegistrar

- (instancetype)initWithPlugin:(NSString *)pluginKey appDelegate:(DemoFlutterPluginAppDelegate *)delegate {
    if(self = [super init]) {
        _pluginKey = pluginKey;
        _appDelegate = delegate;
    }
    return self;
}

- (NSObject<FlutterBinaryMessenger> *)messenger {
    if ([_appDelegate.rootController conformsToProtocol:@protocol(FlutterBinaryMessenger)]) {
        return (NSObject<FlutterBinaryMessenger> *)_appDelegate.rootController;
    }
    return nil;
}

- (NSObject<FlutterTextureRegistry> *)textures {
    if ([_appDelegate.rootController conformsToProtocol:@protocol(FlutterTextureRegistry)]) {
        return (NSObject<FlutterTextureRegistry> *)_appDelegate.rootController;
    }
    return nil;
}

- (void)publish:(NSObject*)value {
    _appDelegate.pluginPublications[_pluginKey] = value;
}

- (void)addMethodCallDelegate:(NSObject<FlutterPlugin>*)delegate channel:(FlutterMethodChannel*)channel {
    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        [delegate handleMethodCall:call result:result];
    }];
}

- (void)addApplicationDelegate:(NSObject<FlutterPlugin>*)delegate {
    [_appDelegate.pluginDelegates addObject:delegate];
}

- (NSString *)lookupKeyForAsset:(NSString *)asset {
    return [FlutterDartProject lookupKeyForAsset:asset];
}

- (NSString *)lookupKeyForAsset:(NSString *)asset fromPackage:(NSString *)package {
    return [FlutterDartProject lookupKeyForAsset:asset fromPackage:package];
}

- (void)registerViewFactory:(nonnull NSObject<FlutterPlatformViewFactory> *)factory withId:(nonnull NSString *)factoryId {
    
}

@end
