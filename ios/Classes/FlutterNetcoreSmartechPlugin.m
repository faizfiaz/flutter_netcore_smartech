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
        NSLog(@"INI LOGNYA%@", call.arguments);
        ModelEvent *modelEvent = [[ModelEvent alloc] initWithJSONString:call.arguments];
        NSLog(@"2INI LOGNYA%@", modelEvent.payloadData);
        [[Smartech sharedInstance] trackEvent:modelEvent.eventName andPayload:modelEvent.payloadData];
        result(@YES);
    }else {
        result(FlutterMethodNotImplemented);
    }
}
@end

