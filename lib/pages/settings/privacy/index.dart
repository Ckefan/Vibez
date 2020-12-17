import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  final greyColor = Color.fromRGBO(184, 184, 184, 1);

  List<GestureDetector> _buildList() => <List>[
        [
          SizedBox(),
          Text(' Account Privacy',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
        ],
        [
          SizedBox(),
          Text(' Public Account',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
          ListTile(
            title: Text('12321'),
          ),
        ],
        [
          SizedBox(),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,
          ),
          SizedBox()
        ],
        [
          SizedBox(),
          Text(' Interaction',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          SizedBox(),
        ],
        [
          Image.asset('lib/assets/images/inbox.png', width: 22.0, height: 18),
          Text(' Comments', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 22)
        ],
        [
          Image.asset('lib/assets/images/tagged.png', width: 22.0, height: 18),
          Text(' Tags', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 22)
        ],
        [
          Icon(Icons.security, color: greyColor, size: 22.0),
          Text(' Mentions', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 22)
        ],
        [
          Image.asset('lib/assets/images/ads.png', width: 22.0, height: 18),
          Text(' Story', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 22)
        ],
        [
          Icon(Icons.account_circle, color: greyColor, size: 22.0),
          Text(' Allow Combo/React',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 22)
        ],
        [
          Image.asset('lib/assets/images/diamond.png', width: 22.0, height: 18),
          Text(' Activity Status',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 22)
        ],
        [
          SizedBox(),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,
          ),
          SizedBox()
        ],
        [
          SizedBox(),
          Text(' Users', style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 22)
        ],
        [
          Icon(Icons.error, color: greyColor, size: 22.0),
          Text(' Restricted Users',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 22)
        ],
        [
          Icon(Icons.error, color: greyColor, size: 22.0),
          Text(' Blocked Users',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 22)
        ],
        [
          Icon(Icons.error, color: greyColor, size: 22.0),
          Text(' Muted Users',
              style: TextStyle(fontSize: 17.0, color: greyColor)),
          Icon(Icons.chevron_right, color: greyColor, size: 22)
        ],
      ]
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      e[0],
                      Expanded(
                        child: e[1],
                      ),
                      // e[2]
                    ],
                  ),
                ),
                onTap: () => operation(index),
              ),
            ),
          )
          .values
          .toList();

  void operation(int index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chart'),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: null,
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          ..._buildList(),
          ListTile(
            title: Text('12321'),
          ),
        ]),
      ),
    );
  }
}
