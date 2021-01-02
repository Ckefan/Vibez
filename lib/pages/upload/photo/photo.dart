import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  CameraController controller;
  var cameras;

  @override
  void initState(){
    super.initState();
    initCamera();
  }

  Future initCamera() async {
    cameras = await availableCameras();
     controller = CameraController(cameras[0], ResolutionPreset.medium);
      controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller?.value?.isInitialized? AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: CameraPreview(controller)):Container();
  }
}