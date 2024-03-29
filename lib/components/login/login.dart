import 'package:Vibez/components/login/confirmationCode.dart';
import 'package:Vibez/components/login/trouble_logging_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final setstatus;
  Login({Key key, this.setstatus}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

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
                top: MediaQuery.of(context).viewInsets.bottom > 0
                    ? 100.0
                    : 300.0,
                bottom:
                    0.0), //MediaQuery.of(context).viewInsets.bottom变量在键盘弹出前是0，键盘弹起后的就是键盘的高度
            child: Text(
              'LOG IN',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
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
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Forgot Login Info? ',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(112, 112, 112, 1),
                    ),
                  ),
                  TextSpan(
                      text: ' Get Help',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(41, 169, 224, 1),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return TroubleLoggingIn();
                          }));
                        }),
                ]),
              ),
            ),
          ),
          Container(
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
                "LOG IN",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300),
              ),
              color: Colors.transparent,
              elevation: 0, // 正常时阴影隐藏
              highlightElevation: 0, // 点击
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ConfirmationCode();
                }));
              },
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
        ],
      ),
    );
  }
}
