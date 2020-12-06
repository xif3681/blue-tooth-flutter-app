import 'package:flutter/material.dart';
import 'package:bluetooth_speaker/models/source.dart';
class DrawerListView extends StatelessWidget {
  DrawerListView({Key key}) : super(key: key);
  List<DrawerModle> list = [
    DrawerModle.fromJson({'title': '设置', 'urlName': '/setting', 'keyName': 'setting', 'icon': Icon(Icons.settings)}),
    DrawerModle.fromJson({'title': '帮助', 'urlName': '/setting', 'keyName': 'setting_help', 'icon': Icon(Icons.help_outline)}),
    DrawerModle.fromJson({'title': '商店', 'urlName': '/setting', 'keyName': 'setting_store', 'icon': Icon(Icons.shopping_cart)}),
    DrawerModle.fromJson({'title': '关于音箱', 'urlName': '/setting', 'keyName': 'setting_about', 'icon': Icon(Icons.info_outline)})
    
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:list.map((e) {
        return ListTile(
        leading: e.icon,
        title: Text(e.title),
        onTap: () {
          // Update the state of the app.
          // ...
          // Then close the drawer.
          Navigator.pop(context);
          Navigator.of(context).pushNamed(e.urlName, arguments: e.title);
        },
      );
      }).toList()
    );
          

  }
}