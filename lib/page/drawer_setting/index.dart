
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
    var pageTTitle=ModalRoute.of(context).settings.arguments;
    List<Widget> list = [];
    List<Widget> listSetting = <Widget> [
      CustomListItem(title: '电子邮件订阅', urlName:'/',),
      CustomListItem(title: '改进计划', urlName:'/',),
    ];
    List<Widget> listHelp = <Widget> [
      CustomListItem(title: '快速指南', urlName:'/',),
      CustomListItem(title: '用户手册', urlName:'/',),
      CustomListItem(title: '联系我们', urlName:'/',),
    ];
    List<Widget> listStore = <Widget> [
      CustomListItem(title: '电子邮件订阅', urlName:'/',),
      CustomListItem(title: '改进计划', urlName:'/',),
    ];
    List<Widget> listAbout = <Widget> [
      CustomListItem(title: '使用条款', urlName:'/',),
      CustomListItem(title: '免费和开源软件', urlName:'/',),
    ];
    switch(pageTTitle) {
      case '应用设置': list = listSetting; break;
      case '帮助': list = listHelp; break;
      case '商店': list = listStore; break;
      case '关于音箱': list = listAbout; break;
      // Defaul list = listSetting;
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(pageTTitle),
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