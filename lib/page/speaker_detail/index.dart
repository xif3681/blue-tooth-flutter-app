import 'package:flutter/material.dart';
class SpeakerDetailPage extends StatefulWidget {

  const SpeakerDetailPage({
    Key key,
    this.id,

  }) : super(key: key);

  final String id;

    @override
   _SpeakerDetailPage createState() => _SpeakerDetailPage();
}
class _SpeakerDetailPage extends State<SpeakerDetailPage> {
    @override
  Widget build(BuildContext context) {
        //获取路由参数  
    var speakerId=ModalRoute.of(context).settings.arguments;
    List<Widget> list = <Widget> [
      ListTile(
        title: Text('电子邮件订阅')
      ),
      ListTile(
        title: Text('改进计划')
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('设置$speakerId'),
      ),
       body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: ListView(
            children: list
          ),
        ),
       )
    );
  }
 }

 