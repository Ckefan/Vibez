import 'package:Vibez/components/home/marquee.dart';
import 'package:flutter/material.dart';

class VideoDescription extends StatefulWidget {
  final description;
  final musicName;
  final authorName;
  final userName;
  VideoDescription(
      {Key key,
      this.description,
      this.musicName,
      this.authorName,
      this.userName})
      : super(key: key);

  @override
  _VideoDescriptionState createState() => _VideoDescriptionState();
}

class _VideoDescriptionState extends State<VideoDescription> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 80.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 25.7,
                        height: 22.5,
                        margin: EdgeInsets.only(bottom: 7.0),
                        child: Image.asset('lib/assets/images/link.png'),
                      ),
                      Text(
                        '12k',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 28.4,
                        height: 22.5,
                        margin: EdgeInsets.only(bottom: 7.0),
                        child:
                            Image.asset('lib/assets/images/inbox-video.png'),
                      ),
                      Text(
                        '12k',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 27.1,
                        height: 22.5,
                        margin: EdgeInsets.only(bottom: 7.0),
                        child: Image.asset('lib/assets/images/share.png'),
                      ),
                      Text(
                        '12k',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text(
                '@${widget.userName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(219, 219, 219, 1)),
              ),
            ),
            Text(
              '${widget.description}',
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
            Row(
              children: [
                Icon(
                  Icons.music_note,
                  size: 20.0,
                  color: Colors.white,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  width: 150,
                  child: Marquee(
                    child: Text(
                      '${widget.musicName} - ${widget.authorName}',
                      style: TextStyle(color: Colors.white),
                    ),
                    direction: Axis.horizontal,
                    textDirection: TextDirection.ltr,
                    animationDuration: Duration(seconds: 1),
                    directionMarguee: DirectionMarguee.oneDirection,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
