import 'package:flutter/material.dart';
import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FollowPeopleContacts extends StatefulWidget {
  @override
  _FollowPeopleContactsState createState() => _FollowPeopleContactsState();
}

class _FollowPeopleContactsState extends State<FollowPeopleContacts>
    with AutomaticKeepAliveClientMixin {
  bool isauthorizat = false; //是否授权
  List<Contact> _list = new List();

  final EasyContactPicker _contactPicker = new EasyContactPicker();
  final greyColor = Color.fromRGBO(184, 184, 184, 1);

  @override
  bool get wantKeepAlive => true; //保存内存中

  void _openAddressBook() async {
    // 申请权限
    // ignore: unused_local_variable
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler()
            .requestPermissions([PermissionGroup.contacts]);

    // 申请结果
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);

    if (permission == PermissionStatus.granted) {
      _getContactData();
    } else {
      print("未授权读取联系人");
    }
  }

  void _getContactData() async {
    List<Contact> list = await _contactPicker.selectContacts();
    // lsit =  {
    //   firstLetter:"A"
    //   fullName:"AppleseedJohn"
    //   phoneNumber:"888-555-1212"
    //   hashCode:949524540
    // }
    setState(() {
      _list = list;
    });
  }

  Widget _listView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            children: [
              Container(
                width: 53.0,
                height: 53.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://img.alicdn.com/imgextra/i1/1822315018/O1CN01PD9Yww1mwI5LtqTN4_!!1822315018.jpg',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_list[index].fullName}',
                      style: TextStyle(
                          color: Color.fromRGBO(246, 246, 246, 1),
                          fontSize: 18.0),
                    ),
                    Text(
                      '${_list[index].phoneNumber}',
                      style: TextStyle(
                          color: Color.fromRGBO(184, 184, 184, 1),
                          fontSize: 13.0),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 111.0,
                height: 29.0,
                child: RaisedButton(
                  color: Color.fromRGBO(41, 169, 224, 1),
                  onPressed: () {
                    print('Follow');
                  },
                  child: Text(
                    'Follow',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      itemCount: _list.length,
    );
  }

  // ignore: must_call_super
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
        child: isauthorizat
            ? _listView()
            : SimpleDialog(
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
                      setState(() {
                        _openAddressBook();
                        isauthorizat = true;
                      });
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                  FlatButton(
                    child: Text('No Thanks'),
                    onPressed: () {
                      Navigator.of(context).pop('cancel');
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
