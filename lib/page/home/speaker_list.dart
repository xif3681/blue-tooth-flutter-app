import 'package:flutter/material.dart';
import 'package:bluetooth_speaker/utils/my_colors.dart';
import 'package:bluetooth_speaker/models/speaker.dart';

class SpeakerListView extends StatefulWidget {

  const SpeakerListView({
    Key key,
  }) : super(key: key);

    @override
   _SpeakerListViewState createState() => _SpeakerListViewState();
}
class _SpeakerListViewState extends State<SpeakerListView> {

  List<SpeakerModle> speakers;
  @override
  void initState() {
    super.initState();
    speakers = getSpeakers();
  }
  List<SpeakerModle> getSpeakers() {
    List data = [ //  Speakers List service
      {'name': 'speak one', 'id': 'xxx1', 'volumeValue': 10.0, 'connectStatus' : 0},
      {'name': 'speak tow', 'id': 'xxx2','volumeValue': 20.0,'connectStatus' : 1},
      {'name': 'speak three', 'id': 'xxx3','volumeValue': 30.0,'connectStatus' : 2},
    ];
    return data.map((item) {
      return SpeakerModle.fromJson(item);
    }).toList();

  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 140.0,
      children: speakers.map((e) {
        return CustomListItem(speakersItem: e);
      }).toList()
    );
  }
}
class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.speakersItem,
  });
  final SpeakerModle speakersItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Container( // 列表item
            height:90.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded( // 左边图片
                  flex: 2,
                  child: GestureDetector(
                    onTap: () { 
                      Navigator.of(context).pushNamed('/source', arguments: speakersItem.id);
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
                ),
                Expanded( // 中介状态
                  flex: 3,
                  child: StatusChangeView( speakersItem: speakersItem,),
                ),
                IconButton( // 右侧图标
                  icon: Icon(
                    Icons.more_horiz,
                    size: 20.0,
                  ),
                  tooltip: '点击查看详情',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/speaker_detail', arguments: speakersItem.id);
                  },
                ),

              ],
            ),
          ),
          Container( // 底下音量调节滑块
            height: 24.0,
            child: Row(
              children: [
                const Icon(
                  Icons.volume_up,
                  size: 20.0,
                  color: MyColors.buttonColor,
                ),
                Expanded(child: VolumeAdjustView(speakersItem: speakersItem),)
              ],
            )
          ),
          Divider()
        ],
      )
    );
  }
}

class VolumeAdjustView extends StatefulWidget { 
  const VolumeAdjustView({
    Key key,
    this.speakersItem,
  }) : super(key: key);

  final SpeakerModle speakersItem;

    @override
   _VolumeAdjustViewState createState() => _VolumeAdjustViewState();
}
class _VolumeAdjustViewState extends State<VolumeAdjustView> {
  double _volumeValue = 0;
  @override
  void initState() {
    super.initState();
    _volumeValue = getVolume();
  }

  void _valueChangeHandle(double value) {
    setState(() {
      _volumeValue = value;
      setVolume(widget.speakersItem.id, value);
    });
  }
  void setVolume(String id, double value) {
     // 调节本地手机音量
     print(value);
  }
  double getVolume() { 
    // 获取本地手机音量
    double _volumeValue = widget.speakersItem.volumeValue;
    return _volumeValue;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new SliderTheme(
         data: SliderThemeData(
            trackHeight: 1.5,
            trackShape: RectangularSliderTrackShape() ,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6,),
            // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6,),
            // overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0)
          ),
          child: Slider(
            value: _volumeValue,
            min: 0,
            max: 100,
            // divisions: 10,
            label: _volumeValue.round().toString(),
            onChanged: _valueChangeHandle,
            activeColor: MyColors.buttonColor,
            inactiveColor: Color(0xFFB3B6B4),
          ), 
      )
   );
  }
}
class StatusChangeView extends StatefulWidget { 
  const StatusChangeView({
    Key key,
    this.speakersItem,

  }) : super(key: key);


  final SpeakerModle speakersItem;

    @override
   _StatusChangeViewState createState() => _StatusChangeViewState();
}
class _StatusChangeViewState extends State<StatusChangeView> {
  int _connectStatus;
  @override
  void initState() {
    super.initState();
    _connectStatus = getConnectStatus();
  }

  void _statusChangeHandle() {
    setState(() {
      if(_connectStatus < 2){
        _connectStatus++;
      } else if(_connectStatus >= 2) {
        _connectStatus = 0;
      }
    });
  }
  void setConnectStatus(int value) {
     // 设置本地手机蓝牙连接状态
     print(value);
  }
  int getConnectStatus() { 
    // 获取本地手机蓝牙连接状态
    int _connectStatus = widget.speakersItem.connectStatus;
    return _connectStatus;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.speakersItem.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Visibility(
            visible: _connectStatus == 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Icon(Icons.done, size: 11.0,),
                Text('已连接',style: TextStyle(fontSize: 11.0,))
              ],
            ),
          ),
          Visibility(
            visible: _connectStatus == 0,
            child: Container(
              width: 55.0,
              height: 24.0,
              child: FlatButton(
              onPressed: _statusChangeHandle,
              color: MyColors.buttonColor,
              height:25.0,
              padding: EdgeInsets.only(top: 2.0,bottom: 4.0),
              child: Text('点击连接',style: TextStyle(fontSize: 11.0,color:Colors.white )
              ),
            ),
            )
          ),
          Visibility(
            visible: _connectStatus == 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text('正在连接...', style: TextStyle(fontSize: 11.0,)),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                ),
                Container(child: CircularProgressIndicator(strokeWidth: 2.0,),height: 11.0,width: 11.0,)

              ],
            ),
          ),

        ],
      ),
    );
  }
}


