import 'dart:ui';

import 'package:Vibez/pages/upload/photo/photo.dart';
import 'package:Vibez/pages/upload/video/video.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final textStyle = TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Padding(
          padding: EdgeInsets.only(top: 67.0, bottom: 60.0),
          child: Column(
            children: [
              Text(
                'What would you \n like to Upload?',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Color.fromRGBO(246, 246, 246, 1),
                    fontFamily: 'ExtraLight'),
              ),
              GridView(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 100),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //横轴三个子widget
                    crossAxisSpacing: 0, //横轴方向的间距。
                    mainAxisSpacing: 100, //竖轴方向的间距。
                    childAspectRatio: 2 //宽高
                    ),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return VideoUpload();
                      }));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('lib/assets/images/Video Upload Icon.png',
                            width: 60.0, height: 40.0),
                        Text(
                          'Video',
                          style: textStyle,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Photo();
                      }));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('lib/assets/images/Photo Upload Icon.png',
                            width: 60.0, height: 54.0),
                        Text(
                          'Photo',
                          style: textStyle,
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('lib/assets/images/Story Upload Icon.png',
                          width: 60.0, height: 60.0),
                      Text(
                        'Story',
                        style: textStyle,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('lib/assets/images/Go Live Icon.png',
                          width: 60.0, height: 54.5),
                      Text(
                        'Go Live',
                        style: textStyle,
                      )
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
