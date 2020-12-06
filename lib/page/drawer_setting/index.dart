
import 'package:flutter/material.dart';
class SettingPage extends StatefulWidget {

  const SettingPage({
    Key key,
    this.id,

  }) : super(key: key);

  final String id;

    @override
   _SettingPage createState() => _SettingPage();
}
class _SettingPage extends State<SettingPage> {
    @override
  Widget build(BuildContext context) {
        //获取路由参数  
    // var speakerId=ModalRoute.of(context).settings.arguments;
    List<Widget> list = <Widget> [
      CustomListItem(title: '电子邮件订阅', urlName:'/',),
      CustomListItem(title: '改进计划', urlName:'/',),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('应用设置'),
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

 class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.title,
    this.urlName,
    this.id,
  });

  final String title;
  final String urlName;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child:Text(title)
          ),
          IconButton(
            icon: Icon(
              Icons.navigate_next,
              size: 20.0,
            ),
            tooltip: '点击查看详情',
            onPressed: () {
              Navigator.of(context).pushNamed("/$urlName", arguments: id);
            },
          ),

        ],
      ),


    );
  }
}