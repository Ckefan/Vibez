import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = "lib/assets/images/vibez-pattern.png";
    final fontColor = TextStyle(
      color: Color.fromRGBO(184, 184, 184, 1),
    );

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
        child: Column(
          children: <Widget>[
            Text(
              'LOG IN',
              style: TextStyle(fontSize: 40.0, color: Colors.white),
            ),
            TextField(
              autofocus: true,
              style:fontColor,
              decoration: InputDecoration(
                hintText: 'USERNAME',
                hintStyle: fontColor
              ),
            ),
            TextField(
              autofocus: false,
              style: fontColor,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'PASSWORD',
                hintStyle: fontColor
              ),
            ),
            Text(
              'Forgot Login Info?',
              style: TextStyle(fontSize: 40.0),
            ),
            RaisedButton(
              child: Text("LOG IN"),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Cancel'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
