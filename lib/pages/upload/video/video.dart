import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoUpload extends StatefulWidget {
  @override
  _VideoUploadState createState() => _VideoUploadState();
}

class _VideoUploadState extends State<VideoUpload> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');

  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    ElevatedButton(
                      child: Text('Get Battery Level'),
                      onPressed: _getBatteryLevel,
                    ),
                    Text(_batteryLevel),
                  ],
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
              child: getMyPatformView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget getMyPatformView() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'plugins.flutter.io/custom_platform_view',
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'plugins.flutter.io/custom_platform_view',
      );
    }

    return Text(
      '$defaultTargetPlatform is not yet supported by this plugin',
      style: TextStyle(fontSize: 50, color: Colors.red),
    );
  }
}
