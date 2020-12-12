import 'package:Vibez/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class EnterBirthday extends StatefulWidget {
  final setstatus;
  EnterBirthday({Key key, this.setstatus}) : super(key: key);

  @override
  _EnterBirthdayState createState() => _EnterBirthdayState();
}

class _EnterBirthdayState extends State<EnterBirthday> {
  var birthdayDate = '';
  var selDate = DateTime(1980, 6, 15);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).viewInsets.bottom > 0 ? 180.0 : 300.0,
              bottom: 10.0),
          child: Text(
            'ENTER YOUR Birthday',
            style: TextStyle(
                fontSize: 25.0,
                color: Color.fromRGBO(246, 246, 246, 1),
                fontFamily: 'Extra'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 14.0),
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(112, 112, 112, 1)),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1800, 1, 1),
                      maxTime: DateTime.now(), onChanged: (date) {
                    // print('change $date');
                  }, onConfirm: (date) {
                    print('confirm $date');
                    setState(() {
                      selDate = date;
                      birthdayDate =
                          '${date.month > 9 ? date.month : '0' + date.month.toString()} / ${date.day > 9 ? date.day : '0' + date.day.toString()} / ${date.year}';
                    });
                  }, currentTime: selDate, locale: LocaleType.en);
                },
                child: Text(
                  birthdayDate != '' ? birthdayDate : 'MM/DD/YYYY',
                  style: TextStyle(
                      color: Color.fromRGBO(184, 184, 184, 1),
                      fontSize: 16.0),
                )),
          ),
        ),
        Text(
          'We ask for your age to provide you with a fun & safe experience will using Vibez',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.0,
            color: Color.fromRGBO(184, 184, 184, 1),
            height: 2,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Home();
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
          onPressed: () => widget.setstatus(2),
        )
      ]),
    );
  }
}
