import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final url;
  VideoPlayer({Key key, this.url});
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) => {
            setState(() {
              _controller.play();
              _controller.setLooping(true);
            })
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: _controller.value.initialized
            ? GestureDetector(
                onTap: () {
                  print(_controller.value.aspectRatio);
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                },
                child: AspectRatio(
                  aspectRatio: 0.656, //_controller.value.aspectRatio,
                  child: VideoPlayer(
                    url: _controller,
                  ),
                ),
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
