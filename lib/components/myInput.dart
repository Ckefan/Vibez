import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  final onSeach;
  @override
  MyInput({Key key, this.onSeach}) : super(key: key);
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController _controller = new TextEditingController();
  final greyColor = Color.fromRGBO(184, 184, 184, 1);
  String search = '';

  void _onSeach(v) {
    setState(() {
      search = v;
    });
    widget.onSeach(v);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      margin: EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            onChanged: (v) => _onSeach(v),
            controller: _controller,
            focusNode: focusNode,
            style: TextStyle(
                color: Color.fromRGBO(
                  246,
                  246,
                  246,
                  1,
                ),
                fontSize: 13.0),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: Color.fromRGBO(246, 246, 246, 1),
              ),
              fillColor: Color.fromRGBO(180, 180, 180, 1),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              hintText: 'Search',
              hintStyle: TextStyle(
                  color: Color.fromRGBO(
                    246,
                    246,
                    246,
                    1,
                  ),
                  fontSize: 13.0),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
          ),
          SizedBox(
            width: 50,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  search = '';
                });
                _controller.clear();
              },
              child: new Icon(
                Icons.clear,
                color: Color.fromRGBO(
                  246,
                  246,
                  246,
                  1,
                ),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
