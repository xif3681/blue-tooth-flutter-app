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
      // _connectionStatus++;

      if(_connectionStatus < 2){
        _connectionStatus++;
      } else if(_connectionStatus >= 2) {
        _connectionStatus = 0;
      }
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
          Visibility(
            visible: _connectionStatus == 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Icon(Icons.done, size: 11.0,),
                Text('已连接',style: TextStyle(fontSize: 11.0,))
              ],
            ),
          ),
          Visibility(
            visible: _connectionStatus == 0,
            child: Container(
              width: 55.0,
              height: 24.0,
              child: FlatButton(
              onPressed: _handleStatusChange,
              color: Colors.lightBlue,
              height:25.0,
              padding: EdgeInsets.only(top: 2.0,bottom: 4.0),
              child: Text('点击连接',style: TextStyle(fontSize: 11.0,color:Colors.white )
              ),
            ),
            )
          ),
          Visibility(
            visible: _connectionStatus == 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text('正在连接...', style: TextStyle(fontSize: 11.0,)),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                ),
                Container(child: CircularProgressIndicator(strokeWidth: 2.0,),height: 11.0,width: 11.0,)
                
                // Icon(Icons.cached,size: 12.0),
              ],
            ),
          ),
          // Text(
          //   '$_connectionStatus',
          //   style: const TextStyle(fontSize: 10.0),
          // ),
          FlatButton(
            onPressed: _handleStatusChange,
            color: Colors.yellow,
            height:25.0,
            padding:EdgeInsets.all( 0.0) ,
            child: Text(
              '点击',
              style: TextStyle(fontSize: 11.0,)
            ),
          )
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
          thumbnail: GestureDetector(
            onTap: () { 
              Navigator.of(context).pushNamed('/source', arguments: 'hi source');
            },
            child: Container(
              child: Image(
                image: AssetImage('assets/images/1.png'),
                width: 100.0,
                fit: BoxFit.fill
              ),
              decoration: const BoxDecoration(color: Colors.blue,),
            ), 
          ),

          title: 'The Flutter YouTube Channel',
        ),
        CustomListItem(
          user: 'Dash',
          viewCount: 884000,
          thumbnail: GestureDetector(
            onTap: () { 
              Navigator.of(context).pushNamed('/source', arguments: 'hi source');
            },
            child: Container(
              child: Image(
                image: AssetImage('assets/images/2.png'),
                width: 100.0,
                fit: BoxFit.fill
              ),
              decoration: const BoxDecoration(color: Colors.blue,),
            ), 
          ),
          title: 'Announcing Flutter 1.0',
        ),
      ],
    );
  }
}