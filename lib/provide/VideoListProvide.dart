import 'package:flutter/cupertino.dart';

class VideoListProvide extends ChangeNotifier {
  //用于保存视频列表
  List _videoList = [];

  get videoList => _videoList;

  //添加
  add(obj) {
    print('保存成功！');
    _videoList.add(obj);
    notifyListeners();
  }
}
