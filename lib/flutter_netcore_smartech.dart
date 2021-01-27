
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterNetcoreSmartech {
  static const MethodChannel _channel =
      const MethodChannel('flutter_netcore_smartech');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get trackingEvent async {
    final String result = await _channel.invokeMethod("trackingEvent");
    return result;
  }
}
