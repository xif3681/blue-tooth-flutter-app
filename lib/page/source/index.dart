import 'package:flutter/material.dart';
import 'package:bluetooth_speaker/models/source.dart';

class SourcePage extends StatefulWidget {

  SourcePage({
    Key key, 
    @required this.text,  // 接收一个text参数
  }) : super(key: key);

   final String text;
     @override
  _SourcePageState createState() => _SourcePageState();
}
class _SourcePageState extends State<SourcePage> with SingleTickerProviderStateMixin {
  // const tabs =  [
  //     {'text': '蓝牙', 'icon': '', 'image': '1.png'}, 
  //     {'text': 'AUX接口', 'icon': '', 'image': '2.png'}, 
  //     {'text': 'RCA接口', 'icon': '', 'image': '3.png'}, 
  // ];

  // var tabs = new List<SourceModle>(10);
  List<SourceModle> tabs = [];
  TabController _tabController; //需要定义一个Controller

  @override
  void initState() {
    super.initState();
      tabs.add(SourceModle.fromJson({'text': '蓝牙', 'icon': '', 'image': '1.png'}));
      tabs.add(SourceModle.fromJson({'text': 'AUX接口', 'icon': '', 'image': '2.png'}));
      tabs.add(SourceModle.fromJson({'text': 'RCA接口', 'icon': '', 'image': '3.png'}));
    // 创建Controller  
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
        //获取路由参数  
    // var args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Source'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: '${e.text}')).toList()
        ),
      ),
      
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) { //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage('assets/images/${e.image}'),
              width: 100.0,
              fit: BoxFit.fill
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //     Image(
            //       image: AssetImage('assets/images/1.png'),
            //       width: 100.0,
            //       fit: BoxFit.fill
            //     ),
            //     // Text('${e.text}')
            //   ]
            // )
          );
        }).toList(),
      )
    );
  }

}
