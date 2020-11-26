import 'package:flutter/material.dart';
class DrawerListView extends StatelessWidget {
  DrawerListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: <Widget>[
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
            onTap: () {
              // Update the state of the app.
              // ...
              // Then close the drawer.
              Navigator.pop(context);
              Navigator.of(context).pushNamed("setting", arguments: "hi setting");
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('帮助'),
            onTap: () {
            // Update the state of the app.
            // ...
            // Then close the drawer.
            Navigator.pop(context);
          },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('商店'),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('关于音箱'),
          ),
        ]);

  }
}