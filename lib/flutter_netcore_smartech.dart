import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_netcore_smartech/model_event.dart';

class FlutterNetcoreSmartech {
  static const MethodChannel _channel =
      const MethodChannel('flutter_netcore_smartech');

  static dynamic encoder(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    if (item is File) {
      return "";
    }
    return item;
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get getNetcoreAppId async {
    final String appId = await _channel.invokeMethod('getNetcoreAppId');
    return appId;
  }

  static Future<bool> trackingEvent(ModelEvent modelEvent) async {
    final bool result = await _channel.invokeMethod("trackingEvent",
        jsonEncode(modelEvent.toJson(), toEncodable: encoder));
    return result;
  }
}
