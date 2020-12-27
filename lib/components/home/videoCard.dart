import 'package:Vibez/provide/VideoListProvide.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  final video;
  VideoCard({Key key, this.video}) : super(key: key);
  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // widget.video.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "====================================================-======================================================================");
    return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.black,
        child: widget.video.value.initialized
            ? Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.video.value.isPlaying) {
                        setState(() {
                          widget.video.pause();
                        });
                      } else {
                        setState(() {
                          widget.video.play();
                        });
                      }
                    },
                    child: AspectRatio(
                      aspectRatio: widget.video.value
                          .aspectRatio, //MediaQuery.of(context).size.width/MediaQuery.of(context).size.height,//0.656, //_controller.value.aspectRatio,
                      child: VideoPlayer(
                        widget.video,
                      ),
                    ),
                  ),
                  !widget.video.value.isPlaying
                      ? GestureDetector(
                          onTap: () {
                            if (widget.video.value.isPlaying) {
                              setState(() {
                                widget.video.pause();
                              });
                            } else {
                              setState(() {
                                widget.video.play();
                              });
                            }
                          },
                          child: Center(
                            child: Image.asset(
                              'lib/assets/images/play.png',
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
