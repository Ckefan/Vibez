import 'dart:convert'; //编码解码库

import 'package:Vibez/components/home/player.dart';
import 'package:Vibez/config/api.dart';
import 'package:Vibez/models/Vibez.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  PageController pageController;
  RequestController api = RequestController();

  List<Widget> videos = [];
  VideoItem firstItem;
  bool isloaded = false;
  int length = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, keepPage: true)
      ..addListener(() {
        print(pageController.position.extentAfter);
        if (pageController.position.pixels <
            pageController.position.maxScrollExtent) {
          //load more data
        }
      });
  }

  Future<void> getFollow() async {
    try {
      var response = await http.get(api.url, headers: api.headers);
      Vibez vibez = Vibez.fromJson(jsonDecode(response.body));
      vibez.billboardData.forEach((item) {
        setState(() {
          getVideos(item).then((value) => {
                print(value),
                if (value == 50) {print('videos length: ${videos.length}')}
              });
        });
      });
      setState(() {
        isloaded = true;
      });
    } catch (err) {
      print(err);
    }
  }

  Future getVideos(BillboardData v) async {
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
                if (url != 'error')
                  {
                    if (length == 0)
                      {
                        firstItem = new VideoItem(
                          data: videoData,
                          videourl: url,
                        )
                      },
                    videos.add(VideoItem(data: videoData, videourl: url))
                  }
              })
          .whenComplete(() => {length++});
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        scrollDirection: Axis.vertical,
        controller: pageController,
        children: videos.length == 0
            ? [
                Container(
                  color: Colors.black,
                  child: Text('加载中'),
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
        children: <Widget>[
          VideoPlayer(
            url: widget.videourl,
          ),
          //title(),
          // VideoDescription(
          //   description: widget.data.itemList[0].desc,
          //   musicName: widget.data.itemList[0].music.title,
          //   authorName: widget.data.itemList[0].music.author,
          //   userName: widget.data.itemList[0].author.nickname,
          // ),
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
