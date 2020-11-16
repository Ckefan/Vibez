import 'package:Vibez/components/login/login.dart';
import 'package:Vibez/components/login/signup.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({Key key, this.type}) : super(key: key);
  final type;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  int status = 0; //0:homepage 1:login 2:signup
  @override
  Widget build(BuildContext context) {
    final avatar = "lib/assets/images/vibez-pattern.png";

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
          image: DecorationImage(
            image: AssetImage(avatar),
            fit: BoxFit.fill,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: status == 0 && widget.type == 1
            ? homeWidget()
            : status == 1
                ? Login(setstatus: setStatus)
                : Signup(setstatus: setStatus),
      ),
    );
  }

  static const logo = AssetImage('lib/assets/images/vibez-text-logo.png');

  void setStatus(val) {
    setState(() {
      status = val;
    });
  }

  Widget homeWidget() => Padding(
        padding: EdgeInsets.all(30.0),
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Image(
              image: logo,
              width: 150.0,
            ),
          ),
          Align(
            alignment: FractionalOffset(0.1, .8),
            child: Container(
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
                onPressed: () => setStatus(1),
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset(0.1, .9),
            child: Container(
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
                onPressed: () => setStatus(2),
              ),
            ),
          ),
        ]),
      );
}
