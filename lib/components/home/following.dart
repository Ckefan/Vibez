import 'dart:convert'; //编码解码库

import 'package:Vibez/components/home/player.dart';
import 'package:Vibez/components/home/video_description.dart';
import 'package:Vibez/config/api.dart';
import 'package:Vibez/models/Vibez.dart';
import 'package:flutter/scheduler.dart';
import 'package:getflutter/getflutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Following extends StatefulWidget {
  Following({Key key});
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  PageController pageController;
  RequestController api = RequestController();

  List<Widget> videos = [];
  VideoItem firstItem;
  int length = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, keepPage: true)
      ..addListener(() {
        if (pageController.position.pixels <
            pageController.position.maxScrollExtent) {
          //load more data
        }
      });
    getFollow().then((value) => print('videos ${videos.length} was finished!'));
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        print('videos is loading!');
      });
    }
  }

  Future<void> getFollow() async {
    try {
      var response = await http.get(api.url, headers: api.headers);
      Vibez vibez = Vibez.fromJson(jsonDecode(response.body));
      print(api.url);
      print('api.url');

      vibez.billboardData.forEach((item) {
        getVideos(item).then(
          (value) => {
            // print('videos length: ${videos.length}'),
          },
        );
      });
    } catch (err) {
      print(err);
    }
  }

  Future<int> getVideos(BillboardData v) async {
    try {
      var url = v.link.split('/')[5];
      var response =
          await http.get(api.video + url + "&dytk", headers: api.headers);
      VideoData videoData = VideoData.fromJson(jsonDecode(response.body));
      //获取无水印的视频地址
      api
          .getRedirects(videoData.itemList[0].video.playaddr.uri)
          .then((url) => {
                url = url.replaceAll('&amp', '&'),
                url = url.replaceAll('http', 'https'),
                print("视频资源：" + url),
                print('videos length: ${videos.length}'),
                if (url != 'error')
                  {
                    if (length == 48)
                      {
                        setState(() {
                          firstItem = new VideoItem(
                            data: videoData,
                            videourl: url,
                          );
                        })
                      },
                    videos.add(VideoItem(data: videoData, videourl: url))
                  }
              })
          .whenComplete(() => {
                length++,
              });
    } catch (err) {
      print(err);
    }
    return length;
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        scrollDirection: Axis.vertical,
        controller: pageController,
        children: videos.length == 0
            ? <Widget>[
                Container(
                  color: Colors.black,
                  child: Center(
                    child: GFLoader(
                      type: GFLoaderType.circle,
                      loaderColorOne: Colors.blueAccent,
                      loaderColorTwo: Colors.white,
                      loaderColorThree: Colors.pink,
                    ),
                  ),
                )
              ]
            : videos);
  }
}

class VideoItem extends StatefulWidget {
  final VideoData data;
  final String videourl;
  const VideoItem({Key key, @required this.data, this.videourl})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          VideoPlayerWidget(
            url: widget.videourl,
          ),
          //title(),
          VideoDescription(
            description: widget.data.itemList[0].desc,
            musicName: widget.data.itemList[0].music.title,
            authorName: widget.data.itemList[0].music.author,
            userName: widget.data.itemList[0].author.nickname,
          ),
          // ActionsToolbar(
          //   comments:
          //       widget.data.itemList[0].statistics.commentCount.toString(),
          //   userImg: widget.data.itemList[0].author.avatarMedium.urlList[0],
          //   favorite: widget.data.itemList[0].statistics.diggCount,
          //   coverImg: widget.data.itemList[0].music.covermedium.urlList[0],
          // ),
        ],
      ),
    );
  }
}
