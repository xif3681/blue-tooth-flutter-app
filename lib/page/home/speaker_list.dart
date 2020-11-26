import 'package:flutter/material.dart';
class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.thumbnail,
    this.title,
    this.user,
    this.viewCount,
  });

  final Widget thumbnail;
  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: VideoDescription(
              title: title,
              user: user,
              viewCount: viewCount,
            ),
          ),
          const Icon(
            Icons.more_horiz,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}

class VideoDescription extends StatefulWidget { 
  const VideoDescription({
    Key key,
    this.title,
    this.user,
    this.viewCount,
  }) : super(key: key);

  final String title;
  final String user;
  final int viewCount;
    @override
   _VideoDescription createState() => _VideoDescription();
}
class _VideoDescription extends State<VideoDescription> {
  int _connectionStatus = 0;

  void _handleStatusChange() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _connectionStatus++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Offstage(
            offstage: _connectionStatus == 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Expanded(child: Icon(Icons.done)),
                Expanded(child: Text('已连接')),
              ],
            ),
          ),
          Offstage(
            offstage: _connectionStatus == 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Expanded(child: Icon(Icons.done)),
                Expanded(
                  child: FlatButton(
                    onPressed: _handleStatusChange,
                    child: Text(
                      '点击连接',
                      
                    ),
                  )
                ),
              ],
            ),
          ),
          Offstage(
            offstage: _connectionStatus == 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Expanded(child: Text('正在连接...')),
                Expanded(child: Icon(Icons.cached)),
              ],
            ),
          ),
          Text(
            '$_connectionStatus',
            style: const TextStyle(fontSize: 10.0),
          ),
          // Text(
          //   widget.user,
          //   style: const TextStyle(fontSize: 10.0),
          // ),
          // const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          // Text(
          //   '$widget.viewCount views',
          //   style: const TextStyle(fontSize: 10.0),
          // ),
        ],
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class SpeakerListView extends StatelessWidget {
  SpeakerListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      children: <CustomListItem>[
        CustomListItem(
          user: 'Flutter',
          viewCount: 999000,
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          title: 'The Flutter YouTube Channel',
        ),
        CustomListItem(
          user: 'Dash',
          viewCount: 884000,
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.yellow),
          ),
          title: 'Announcing Flutter 1.0',
        ),
      ],
    );
  }
}