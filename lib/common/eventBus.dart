import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

//暂停视频
class PauseVideo {
  int index;
  PauseVideo(index) {
    this.index = index;
  }
}

class PlayVideo {
  int index;
  PlayVideo(index) {
    this.index = index;
  }
}
