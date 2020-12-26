import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class PlayStore extends ChangeNotifier {
  //用于保存视频播放控件
  VideoPlayerController _controller;

  get controller => _controller;
  //注册控件
  enroll(obj) {
    print(
        "=======================================================================store");
    _controller = obj;
  }

  //播放
  play() {
    print(123123);
    _controller.play();
    notifyListeners();
  }

  //暂停
  pause() {
    _controller.pause();
    notifyListeners();
  }
}
