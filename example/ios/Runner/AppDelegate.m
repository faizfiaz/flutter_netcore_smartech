#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <Smartech/Smartech.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[Smartech sharedInstance] initSDKWithDelegate:(id)self withLaunchOptions:launchOptions];
    [[Smartech sharedInstance] registerForPushNotificationWithDefaultAuthorizationOptions];
    [[Smartech sharedInstance] setDebugLevel:SMTLogLevelVerbose];
    [[Smartech sharedInstance] trackAppInstallUpdateBySmartech];
    
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
