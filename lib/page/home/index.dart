import 'package:flutter/material.dart';
import 'package:bluetooth_speaker/page/home/speaker_list.dart';
import 'package:bluetooth_speaker/page/home/drawer_list.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: DrawerListView(),
      ),
      body: SpeakerListView(),
    );
  }
}
