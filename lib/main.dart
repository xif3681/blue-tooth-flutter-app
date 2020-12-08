import 'package:flutter/material.dart';
import 'package:bluetooth_speaker/utils/my_colors.dart';
import 'package:bluetooth_speaker/page/splash_screen.dart';
import 'package:bluetooth_speaker/page/home/index.dart';
import 'package:bluetooth_speaker/page/drawer_setting/index.dart';
import 'package:bluetooth_speaker/page/source/index.dart';
import 'package:bluetooth_speaker/page/speaker_detail/index.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomePage(title: 'BluetoothSpeaker',),
  "/setting": (BuildContext context) => SettingPage(),
  "/source": (BuildContext context) => SourcePage(text: '激活',),
  "/speaker_detail": (BuildContext context) => SpeakerDetailPage(),
};
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
        primaryColor: MyColors.primaryColor, 
        scaffoldBackgroundColor: MyColors.scaffoldBackgroundColor,
        buttonColor: MyColors.buttonColor,
        accentColor: MyColors.accentColor,
        canvasColor: MyColors.scaffoldBackgroundColor,

        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(centerTitle: true),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
        //注册路由表
      routes:routes,
    );
  }
}

