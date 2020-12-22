import 'package:Vibez/pages/entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class ConfirmationCode extends StatefulWidget {
  @override
  _ConfirmationCodeState createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<ConfirmationCode> {
  var isEmail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Entry(typeStatus: 1);
                      }))
                    },
                  ),
                  Text(
                    'Confirmation Code',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontFamily: 'Medium'),
                  ),
                  Container(
                    width: 30.0,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 29.0),
                      child: Text(
                        'Enter Code',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Extra',
                          color: Color.fromRGBO(246, 246, 246, 1),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.0, bottom: 20.0),
                      child: Text(
                        isEmail
                            ? 'Enter the 6 digit code we sent to your email Vibez*********@gmail.com to log in.'
                            : 'Enter the 6 digit code we sent to your number ending in 8336 to log in.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(184, 184, 184, 1),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Use my email Instead',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(41, 169, 224, 1),
                        ),
                      ),
                      onTap: () => setState(() {
                        isEmail = !isEmail;
                      }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 107.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //     color: Color.fromRGBO(112, 112, 112, 1)),
                            ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 13.0),
                          child: PinInputTextField(
                            autoFocus: true,
                            pinLength: 6,
                            decoration: UnderlineDecoration(
                              textStyle: TextStyle(
                                color: Color.fromRGBO(41, 169, 224, 1),
                                fontSize: 15.0,
                              ),
                              colorBuilder: PinListenColorBuilder(
                                  Colors.cyan, Colors.white),
                            ),
                            onChanged: (value) => {print(value)},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
