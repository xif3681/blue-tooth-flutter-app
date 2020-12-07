import 'package:flutter/material.dart';
import 'package:bluetooth_speaker/utils/my_colors.dart';
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

  List<SourceModle> tabs = [
    SourceModle.fromJson({'text': '蓝牙', 'icon': Icon(Icons.bluetooth), 'image': '1.png'}),
    SourceModle.fromJson({'text': 'AUX接口', 'icon': Icon(Icons.settings_brightness), 'image': '2.png'}),
    SourceModle.fromJson({'text': 'AUX接口', 'icon': Icon(Icons.settings_brightness), 'image': '2.png'})
  ];
  int _currIndex = 0;
  // TabController _tabController; //需要定义一个Controller

  @override
  void initState() {
    super.initState();

    // 创建Controller  
    // _tabController = TabController(length: tabs.length, vsync: this);
  }
  void _setCurrIndex(int index) {
    setState(() {
      _currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            _setCurrIndex(tabController.index);
          }
        });
   
        return Scaffold(
          appBar: AppBar(
            title: Text('Player Source'),
            bottom: TabBar(
              tabs: tabs.map((e) => Tab(
                text: e.text, 
                icon: e.icon,
              )).toList()
            ),
          ),
          
          body: TabBarView(
            // controller: _tabController,
            children: tabs.map((e) { //创建3个Tab页
              return Container(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/${e.image}'),
                  width: 100.0,
                  fit: BoxFit.fill
                ),

              );
            }).toList(),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Add your onPressed code here!
            },
            label: Text('点击激活$_currIndex',style: TextStyle(color:Colors.white )),
            icon: Icon(Icons.thumb_up, color:Colors.white,),
            backgroundColor: MyColors.buttonColor,
          ),
        );
      })
    );
  }

}
