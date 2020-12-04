import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final url;
  VideoPlayerWidget({Key key, this.url}) : super(key: key);
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) => {
            print("进入了controller"),
            setState(() {
              _controller.play();
              _controller.setLooping(true);
            })
          });
  }

  void pause() {
    _controller.pause();
  }

  void play() {
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_controller.value.initialized);
    print("------------------------------------");
    return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.black,
        child: _controller.value.initialized
            ? Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_controller.value.isPlaying) {
                        setState(() {
                          _controller.pause();
                        });
                      } else {
                        setState(() {
                          _controller.play();
                        });
                      }
                    },
                    child: AspectRatio(
                      aspectRatio: _controller.value
                          .aspectRatio, //MediaQuery.of(context).size.width/MediaQuery.of(context).size.height,//0.656, //_controller.value.aspectRatio,
                      child: VideoPlayer(
                        _controller,
                      ),
                    ),
                  ),
                  !_controller.value.isPlaying
                      ? GestureDetector(
                          onTap: () {
                            if (_controller.value.isPlaying) {
                              setState(() {
                                _controller.pause();
                              });
                            } else {
                              setState(() {
                                _controller.play();
                              });
                            }
                          },
                          child: Center(
                            child: Image.asset(
                              'lib//assets/images/play.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              )
            : loadingVideo());
  }

  Widget loadingVideo() => Container(
        color: Colors.black,
        child: Center(
          child: GFLoader(
            type: GFLoaderType.circle,
            loaderColorOne: Colors.blueAccent,
            loaderColorTwo: Colors.black,
            loaderColorThree: Colors.pink,
          ),
        ),
      );
}
