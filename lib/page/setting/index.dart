import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  
  SettingPage({
    Key key, 
    @required this.text,  // 接收一个text参数
  }) : super(key: key);

   final String text;

  @override
  Widget build(BuildContext context) {
        //获取路由参数  
    var args=ModalRoute.of(context).settings.arguments;
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
        title: Text("设置"),
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