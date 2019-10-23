#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <Flutter/Flutter.h>

@implementation AppDelegate

- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"samples.chenhang/utils" binaryMessenger:(FlutterViewController *)self.window.rootViewController];
    //往方法通道注册方法调用处理回调
    [channel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        //方法名称一致
        if ([@"openAppMarket" isEqualToString:call.method]) {
            //打开App Store(本例打开微信的URL)
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/xy/app/foo/id414478124"]];
            //返回方法处理结果
            result(@0);
        } else {
            //找不到被调用的方法
            result(FlutterMethodNotImplemented);
        }
    }];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
