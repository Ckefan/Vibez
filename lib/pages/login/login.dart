import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset(
      "lib/assets/images/vibez-pattern.png",
      width: double.infinity,
      height: 71.85,
    );
    return Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 78.16),
        color: Colors.black,
        child: avatar);
  }
}
