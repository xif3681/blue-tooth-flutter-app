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
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
       body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("$args返回"),
              )
            ],
          ),
        ),
       )
    );
  }

}