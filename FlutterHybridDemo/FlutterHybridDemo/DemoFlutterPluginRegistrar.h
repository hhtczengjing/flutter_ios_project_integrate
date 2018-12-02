//
//  DemoFlutterPluginRegistrar.h
//  FlutterHybridDemo
//
//  Created by zengjing on 2018/11/25.
//  Copyright © 2018年 devzeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoFlutterPluginAppDelegate.h"
#import <Flutter/Flutter.h>

@interface DemoFlutterPluginRegistrar : NSObject<FlutterPluginRegistrar>

@property (nonatomic, copy) NSString *pluginKey;
@property (nonatomic, strong) DemoFlutterPluginAppDelegate *appDelegate;

- (instancetype)initWithPlugin:(NSString *)pluginKey appDelegate:(DemoFlutterPluginAppDelegate *)delegate;

@end
