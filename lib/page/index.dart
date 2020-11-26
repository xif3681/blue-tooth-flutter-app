import 'package:flutter/material.dart';
import 'package:bluetooth_speaker/page/home.dart';
class AppPage extends StatefulWidget {
  AppPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the AppPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
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
        ])
      ),
      body: HomePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
