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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: MyColors.primaryColor, 
        // scaffoldBackgroundColor: Color(0xFF7BA696),
        buttonColor: MyColors.buttonColor,
        accentColor: MyColors.accentColor,

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // initialRoute:"/", //名为"/"的路由作为应用的home(首页)
        //注册路由表
      routes:routes,
      // home: HomePage(title: '蓝牙音箱'),
    );
  }
}

