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
  // const tabs =  [
  //     {'text': '蓝牙', 'icon': '', 'image': '1.png'}, 
  //     {'text': 'AUX接口', 'icon': '', 'image': '2.png'}, 
  //     {'text': 'RCA接口', 'icon': '', 'image': '3.png'}, 
  // ];

  // var tabs = new List<SourceModle>(10);
  List<SourceModle> tabs = [];
  int _currIndex = 0;
  // TabController _tabController; //需要定义一个Controller
  

  @override
  void initState() {
    super.initState();
      tabs.add(SourceModle.fromJson({'text': '蓝牙', 'icon': IconData(0xe5ec, fontFamily: 'MaterialIcons'), 'image': '1.png'}));
      tabs.add(SourceModle.fromJson({'text': 'AUX接口', 'icon': IconData(0xe9ca, fontFamily: 'MaterialIcons'), 'image': '2.png'}));
      tabs.add(SourceModle.fromJson({'text': 'RCA接口', 'icon': IconData(0xeab5, fontFamily: 'MaterialIcons'), 'image': '3.png'}));
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
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
            _setCurrIndex(tabController.index);
          }
        });
   
        return Scaffold(
          appBar: AppBar(
            title: Text('Player Source'),
            bottom: TabBar(
              // controller: _tabController,
              // indicatorColor: MyColors.accentColor,
              tabs: tabs.map((e) => Tab(
                text: e.text, 
                icon: Icon(e.icon),
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
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Add your onPressed code here!
            },
            label: Text('点击激活$_currIndex',style: TextStyle(color:Colors.white )),
            icon: Icon(Icons.thumb_up),
            backgroundColor: MyColors.buttonColor,
          ),
        );
      })
    );
  }

}
