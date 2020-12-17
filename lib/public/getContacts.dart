import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class GetContacts extends StatefulWidget {
  @override
  _GetContactsState createState() => _GetContactsState();
}

class _GetContactsState extends State<GetContacts>
    with AutomaticKeepAliveClientMixin {
  List<Contact> _list = new List();
  final EasyContactPicker _contactPicker = new EasyContactPicker();

  @override
  void initState() {
    super.initState();
    _openAddressBook();
  }

  _openAddressBook() async {
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
    }
  }

  _getContactData() async {
    List<Contact> list = await _contactPicker.selectContacts();
    setState(() {
      print('----------------------------------------------------------');
      print(list.length);
      print(
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      _list = list;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("通讯录"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return _getItemWithIndex(_list[index]);
          },
          itemCount: _list.length,
        ));
  }

  Widget _getItemWithIndex(Contact contact) {
    return Container(
      height: 45,
      padding: EdgeInsets.only(left: 13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            contact.fullName,
            style: TextStyle(color: Colors.red),
          ),
          Text(
            contact.phoneNumber,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
