import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VideoUpload extends StatefulWidget {
  @override
  _VideoUploadState createState() => _VideoUploadState();
}

class _VideoUploadState extends State<VideoUpload> {
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
            ),
          ),
          Expanded(
            flex: 2,
            child: getMyPatformView(),
          ),
        ],
      ),
    );
  }

  Widget getMyPatformView() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'MyUiKitView',
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'MyUiKitView',
      );
    }

    return Text(
      '$defaultTargetPlatform is not yet supported by this plugin',
      style: TextStyle(fontSize: 50, color: Colors.red),
    );
  }
}
