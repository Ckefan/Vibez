import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = "lib/assets/images/vibez-pattern.png";
    final fontColor =
        TextStyle(color: Color.fromRGBO(184, 184, 184, 1), fontSize: 15.0);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(avatar),
            fit: BoxFit.fill,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 317.0, bottom: 20.0),
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                      fontSize: 40.0,
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
                      ),
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
                    end: Alignment(0.0, -1.0),
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
                        fontSize: 25.0,fontWeight: FontWeight.w300),
                  ),
                  color: Colors.transparent,
                  onPressed: () {},
                ),
              ),
              RaisedButton(
                color: Colors.transparent,
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
