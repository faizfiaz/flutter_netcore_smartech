import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netcore_smartech/flutter_netcore_smartech.dart';
import 'package:flutter_netcore_smartech/model_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _resultTracking = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String resultTracking;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      resultTracking = await FlutterNetcoreSmartech.getNetcoreAppId;
    } on PlatformException {
      resultTracking = 'Failed to tracking event';
    }

    ModelEvent modelEvent = new ModelEvent();
    modelEvent.eventName = "Add To Cart";

    HashMap<String, Object> payloadData = new HashMap();
    payloadData["name"] = "Nexus 5";
    modelEvent.payloadData = jsonEncode(payloadData,
        toEncodable: FlutterNetcoreSmartech.encoder);
    FlutterNetcoreSmartech.trackingEvent(modelEvent);

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _resultTracking = resultTracking;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Tracking Event: $_resultTracking\n'),
        ),
      ),
    );
  }
}
