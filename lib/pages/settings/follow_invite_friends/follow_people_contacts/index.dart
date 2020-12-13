import 'package:flutter/material.dart';

class FollowPeopleContacts extends StatefulWidget {
  @override
  _FollowPeopleContactsState createState() => _FollowPeopleContactsState();
}

class _FollowPeopleContactsState extends State<FollowPeopleContacts> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);

  void operation(int index) => {print(index)};

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Follow People in Contacts"),
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          leading: null),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: SimpleDialog(
          contentPadding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
          title: Center(
            child: Text(
              'Find People',
              style: TextStyle(
                  fontSize: 17.0,
                  fontFamily: 'Medum',
                  color: Color.fromRGBO(19, 19, 20, 1)),
            ),
          ),
          children: <Widget>[
            Container(
              height: 70.0,
              width: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                'Connect your contacts to Vibez to find people you may know. You choose who to follow anytime. Disconnect Contact sync anytime.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromRGBO(112, 112, 112, 1),
                ),
              ),
            ),
            Divider(
              height: 1,
            ),
            FlatButton(
              child: Text(
                'Connect',
                style: TextStyle(
                  color: Color.fromRGBO(41, 169, 224, 1),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop('cancel');
              },
            ),
            Divider(
              height: 1,
            ),
            FlatButton(
              child: Text('No Thanks'),
              onPressed: () {
                Navigator.of(context).pop('ok');
              },
            ),
          ],
        ),
      ),
    );
  }
}
