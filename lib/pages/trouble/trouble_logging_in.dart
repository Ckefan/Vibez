import 'package:Vibez/pages/entry/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TroubleLoggingIn extends StatefulWidget {
  @override
  _TroubleLoggingInState createState() => _TroubleLoggingInState();
}

class _TroubleLoggingInState extends State<TroubleLoggingIn> {
  int forgotStatus = 1; //1:forgot username  2:forgot password
  @override
  Widget build(BuildContext context) {
    final fontColor =
        TextStyle(color: Color.fromRGBO(184, 184, 184, 1), fontSize: 15.0);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Color.fromRGBO(0, 89, 135, 1),
              ]),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 113.0),
          child: Column(children: <Widget>[
            Text(
              "Trouble Logging IN?",
              style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromRGBO(246, 246, 246, 1),
                  fontFamily: 'Extra'),
            ),
            Container(
              margin: EdgeInsets.only(top: 37.0),
              width: 186.0,
              height: 31.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [
                    Color.fromRGBO(41, 169, 224, 1),
                    Color.fromRGBO(82, 168, 204, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: RaisedButton(
                child: Text(
                  "FORGOT USERNAME",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w300),
                ),
                color: Colors.transparent,
                elevation: 0, // 正常时阴影隐藏
                highlightElevation: 0, // 点击
                onPressed: () => setState(() {
                  forgotStatus = 1;
                }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 7.0, bottom: 17.0),
              width: 186.0,
              height: 31.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [
                    Color.fromRGBO(41, 169, 224, 1),
                    Color.fromRGBO(82, 168, 204, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: RaisedButton(
                child: Text(
                  "FORGOT PASSWORD",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w300),
                ),
                color: Colors.transparent,
                elevation: 0, // 正常时阴影隐藏
                highlightElevation: 0, // 点击
                onPressed: () => setState(() {
                  forgotStatus = 2;
                }),
              ),
            ),
            Text(
              forgotStatus == 1 ? 'FORGOT USERNAME' : 'FORGOT PASSWORD',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 17.0, bottom: 10.0),
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
                        hintText: 'EMAIL OR PHONE NUMBER',
                        border: InputBorder.none,
                        hintStyle: fontColor),
                  ),
                ),
              ),
            ),
            forgotStatus == 2
                ? Container(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(112, 112, 112, 1)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 13.0),
                        child: TextField(
                          autofocus: true,
                          style: fontColor,
                          decoration: InputDecoration(
                              hintText: 'USERNAME',
                              border: InputBorder.none,
                              hintStyle: fontColor),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [
                    Color.fromRGBO(41, 169, 224, 1),
                    Color.fromRGBO(82, 168, 204, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: RaisedButton(
                child: Text(
                  "SEND",
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
            Container(
              height: 32.0,
              child: RaisedButton(
                color: Colors.transparent,
                elevation: 0, //normal shadow
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 12.0,
                      fontFamily: 'Regular'),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Entry(typeStatus: 1);
                  }));
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
