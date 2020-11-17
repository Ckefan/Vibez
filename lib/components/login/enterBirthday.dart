import 'package:flutter/material.dart';

class EnterBirthday extends StatefulWidget {
  final setstatus;
  EnterBirthday({Key key, this.setstatus}) : super(key: key);

  @override
  _EnterBirthdayState createState() => _EnterBirthdayState();
}

class _EnterBirthdayState extends State<EnterBirthday> {
  @override
  Widget build(BuildContext context) {
    final fontColor =
        TextStyle(color: Color.fromRGBO(184, 184, 184, 1), fontSize: 15.0);

    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(children: [
        Text(
          'ENTER YOUR Birthday',
          style: TextStyle(
              fontSize: 25.0,
              color: Color.fromRGBO(246, 246, 246, 1),
              fontFamily: 'Extra'),
        ),
        Container(
          margin: EdgeInsets.only(top: 14.0, bottom: 10.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(112, 112, 112, 1)),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 13.0),
              child: TextField(
                autofocus: true,
                style: fontColor,
                decoration: InputDecoration(
                    hintText: 'MM/DD/YYY',
                    border: InputBorder.none,
                    hintStyle: fontColor),
              ),
            ),
          ),
        ),
        Text(
          '',
          style: TextStyle(
              fontSize: 11.0,
              color: Color.fromRGBO(184, 184, 184, 1),
              letterSpacing: 20.0),
        ),
        Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [
                Color.fromRGBO(255, 35, 57, 1),
                Color.fromRGBO(188, 0, 53, 1),
              ],
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: RaisedButton(
            child: Text(
              "SIGN UP",
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 25.0,
                  fontWeight: FontWeight.w300),
            ),
            color: Colors.transparent,
            elevation: 0, // 正常时阴影隐藏
            highlightElevation: 0, // 点击
            onPressed: () {},
          ),
        ),
        RaisedButton(
          color: Colors.transparent,
          elevation: 0, //normal shadow
          child: Text(
            'Cancel',
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1), fontSize: 12.0),
          ),
          onPressed: () => widget.setstatus(0),
        )
      ]),
    );
  }
}
