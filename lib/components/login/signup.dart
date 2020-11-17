import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final setstatus;
  Signup({Key key, this.setstatus}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final fontColor =
        TextStyle(color: Color.fromRGBO(184, 184, 184, 1), fontSize: 15.0);
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top:
                    MediaQuery.of(context).viewInsets.bottom > 0 ? 10.0 : 300.0,
                bottom:
                    10.0), //MediaQuery.of(context).viewInsets.bottom变量在键盘弹出前是0，键盘弹起后的就是键盘的高度
            child: Text(
              'SIGN UP',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
          Container(
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
                      hintText: 'PHONE NUMBER OR EMAIL',
                      border: InputBorder.none,
                      hintStyle: fontColor),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
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
                      hintText: 'NAME',
                      border: InputBorder.none,
                      hintStyle: fontColor),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                      hintText: 'USERNAME',
                      border: InputBorder.none,
                      hintStyle: fontColor),
                ),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(112, 112, 112, 1)),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 13.0),
              child: TextField(
                autofocus: false,
                style: fontColor,
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'PASSWORD',
                    hintStyle: fontColor,
                    border: InputBorder.none),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                "NEXT",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300),
              ),
              color: Colors.transparent,
              elevation: 0, // 正常时阴影隐藏
              highlightElevation: 0, // 点击
              onPressed: () => widget.setstatus(3),
            ),
          ),
          Text(
            'By signing up you agree to our Terms & Privacy Policy',
            style: TextStyle(
                color: Color.fromRGBO(184, 184, 184, 1), fontSize: 12.0),
          ),
          Container(
            height: 32.0,
            child: RaisedButton(
              color: Colors.transparent,
              elevation: 0, //normal shadow
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1), fontSize: 12.0),
              ),
              onPressed: () => widget.setstatus(0),
            ),
          ),
        ],
      ),
    );
  }
}
