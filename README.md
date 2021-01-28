# Flutter Netcore Smartech
---

A Flutter Plugin to Use Netcore Smartech.

## Getting Started
---
this plugin is open for all people who want using NetCore Smartech,
but in this version, only support for Custom Eventracker with payload data and not yet supported for notification, user tracker and other feature in Netcore Smartech,

feel free to create pull request to me and thanks if you want to contribute in this plugin.

## Integration
---

Add dependecy to your pubspec.yampl

```
 flutter_netcore_smartech: ^0.0.x (see the latest version)
```

##### Android Integration
---
You only need to add this code to your AndroidManifest.xml

```
<meta-data
    android:name="SMT_APP_ID"
    android:value="YOUR_NETCORE_APP_ID" />
```

##### IOS Integration
---
For IOS Integration you need to add

#### Step 1
Add this line code to your Info.plist

```
 <key>SmartechKeys</key>
    <dict>
        <key>SmartechAppGroup</key>
        <string>group.com.CompanyName.ProductName</string>
        <key>SmartechAppId</key>
        <string>YOUR_NETCORE_APP_ID</string>
        <key>SmartechUseAdvId</key>
        <false/>
        <key>SmartechAutoFetchLocation</key>
        <false/>
    </dict>
```
for all key you can see the purpose in Netcore Documentation https://docs.netcoresmartech.com/docs/ios-sdk-v3-adding-and-configuring-of-extensions-in-your-app

#### Step 2
Add this to your AppDelegate

if you using Objective-C
```
[[Smartech sharedInstance] initSDKWithDelegate:(id)self withLaunchOptions:launchOptions];
[[Smartech sharedInstance] registerForPushNotificationWithDefaultAuthorizationOptions];
[[Smartech sharedInstance] setDebugLevel:SMTLogLevelVerbose];
[[Smartech sharedInstance] trackAppInstallUpdateBySmartech];
```

if you using Swift

```
Smartech.sharedInstance().initSDK(with: self, withLaunchOptions: launchOptions)
Smartech.sharedInstance().registerForPushNotificationWithDefaultAuthorizationOptions()
Smartech.sharedInstance().setDebugLevel(.verbose)
Smartech.sharedInstance().trackAppInstallUpdateBySmartech()
```

And Done you can use tracking event now.

## Usage
---

for make sure your app already linked with Netcore you can hit this method getNetcoreAppId and see if the return ID is match with yours.

```
print(FlutterNetcoreSmartech.getNetcoreAppId);
```

for Custom Tracking Event you need to bundle your Event Name and Payload Data to ModelEvent.

Example
```
ModelEvent modelEvent = new ModelEvent();
modelEvent.eventName = "Add To Cart";

HashMap<String, Object> payloadData = new HashMap();
payloadData["name"] = "Nexus 5";
modelEvent.payloadData = jsonEncode(payloadData,
        toEncodable: FlutterNetcoreSmartech.encoder);
FlutterNetcoreSmartech.trackingEvent(modelEvent);
```

## Dart Versions
---
```
>=2.7.0 <3.0.0
````

## Maintainers
---
```
[faizfiaz](https://github.com/faizfiaz)
````