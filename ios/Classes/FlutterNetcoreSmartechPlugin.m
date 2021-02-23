#import "FlutterNetcoreSmartechPlugin.h"
#import <Smartech/Smartech.h>
#import "ModelEvent.h"

@implementation FlutterNetcoreSmartechPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutter_netcore_smartech"
                                     binaryMessenger:[registrar messenger]];
    FlutterNetcoreSmartechPlugin* instance = [[FlutterNetcoreSmartechPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    
    
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getNetcoreAppId" isEqualToString:call.method]) {
        result([[Smartech sharedInstance] getAppId]);
    } else if ([@"trackingEvent" isEqualToString:call.method]){
        ModelEvent *modelEvent = [[ModelEvent alloc] initWithJSONString:call.arguments];
        [[Smartech sharedInstance] trackEvent:modelEvent.eventName andPayload:modelEvent.payloadData];
        result(@YES);
    } else if ([@"setIdentityUser" isEqualToString:call.method]){
        [[Smartech sharedInstance] setUserIdentity:call.arguments];
        result(@YES);
    } else if ([@"loginUser" isEqualToString:call.method]){
        [[Smartech sharedInstance] login:call.arguments];
        result(@YES);
    } else if ([@"logoutUser" isEqualToString:call.method]){
        [[Smartech sharedInstance] logoutAndClearUserIdentity:YES];
        result(@YES);
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}
@end

