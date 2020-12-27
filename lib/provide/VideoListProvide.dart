import 'package:flutter/cupertino.dart';

class VideoListProvide extends ChangeNotifier {
  // VideoPlayerController controller;

  //用于保存视频列表
  List _videoList = [];

  get videoList => _videoList;

  replace(arr) {
    _videoList = arr;
    notifyListeners();
  }

  //添加
  add(obj) {
    _videoList.add(obj);
    notifyListeners();
  }

  loadVideo(controller) async {
    await initializeVideo(controller);
    controller.play();
    notifyListeners();
  }

  //更新单个视频
  initializeVideo(controller) async {
    await controller.initialize();
    controller.setLooping(true);
  }
}
