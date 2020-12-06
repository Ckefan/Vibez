import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class PlayStore extends ChangeNotifier {
  //用于保存视频播放控件
  VideoPlayerController controller;

  //注册控件
  void enroll(obj) {
    print(obj);
    print("=======================================================================store");

    controller = obj;
  }

  //播放
  void play() {
    controller.play();
  }

  //暂停
  void pause() {
    controller.pause();
  }
}
