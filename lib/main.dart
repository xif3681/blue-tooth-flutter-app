import 'package:flutter/material.dart';
import 'package:bluetooth_speaker/page/setting/index.dart';
import 'package:bluetooth_speaker/page/home/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute:"/", //名为"/"的路由作为应用的home(首页)
        //注册路由表
      routes:{
      "setting":(context) => SettingPage(text: '设置',),
      "/":(context) => HomePage(title: '蓝牙音箱'), //注册首页路由
      },
      // home: HomePage(title: '蓝牙音箱'),
    );
  }
}

