import 'package:Vibez/provide/ProfileChangeProvide.dart';
import 'package:Vibez/provide/VideoListProvide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/entry/entry.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: VideoListProvide()),
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        canvasColor: Colors.transparent,
        fontFamily: 'Regular',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Entry(),
    );
  }
}
