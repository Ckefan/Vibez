import 'package:Vibez/components/login/enterBirthday.dart';
import 'package:Vibez/components/login/login.dart';
import 'package:Vibez/components/login/signup.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Entry extends StatefulWidget {
  //typeStatus is “from trouble_logging_in” page to Entry ，show login
  final typeStatus;
  Entry({Key key, this.typeStatus}) : super(key: key);
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  int status = 0; //0:Entrypage 1:login 2:signup 3:EnterBirthday
  int typeStatus = 0;

  @override
  void initState() {
    super.initState();
    typeStatus = widget.typeStatus;
  }

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
        child: status == 1 || typeStatus == 1
            ? Login(setstatus: setStatus)
            : status == 0
                ? entryWidget()
                : status == 2
                    ? Signup(setstatus: setStatus)
                    : EnterBirthday(setstatus: setStatus),
      ),
    );
  }

  static const logo = AssetImage('lib/assets/images/vibez-text-logo.png');

  void setStatus(val) {
    setState(() {
      status = val;
      typeStatus = val == 0 ? 0 : typeStatus; //if login page click Cancel  is 0
    });
  }

  Widget entryWidget() => Padding(
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
