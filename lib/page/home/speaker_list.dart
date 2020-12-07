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

  List<SpeakerModle> speakers = [];
  // List<CustomListItem> customListItem = [];
  @override
  void initState() {
    super.initState();
      speakers.add(SpeakerModle.fromJson({'name': 'speak one','title': 'title1', 'id': 'xxx1'}));
      speakers.add(SpeakerModle.fromJson({'name': 'speak tow','title': 'title2', 'id': 'xxx2'}));
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 140.0,
      children: speakers.map((e) {
        return CustomListItem(
          thumbnail: GestureDetector(
            onTap: () { 
              Navigator.of(context).pushNamed('/source', arguments: e.id);
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

          title: '${e.id}${e.name}',
          id: '${e.id}',
          speakersItem: e,
          );
      }).toList()

    );
  }
}
class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.thumbnail,
    this.title,
    this.id,
    this.speakersItem,
  });

  final Widget thumbnail;
  final String title;
  final String id;
  final SpeakerModle speakersItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Container(
            height:90.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: thumbnail,
                ),
                Expanded(
                  flex: 3,
                  child: StatusDescription(
                    title: title,
      
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 20.0,
                  ),
                  tooltip: '点击查看详情',
                  onPressed: () {
                    Navigator.of(context).pushNamed("/speaker_detail", arguments: id);
                  },
                ),

              ],
            ),
          ),
          Container(
            height: 24.0,
            child: Row(
              children: [
                const Icon(
                  Icons.volume_up,
                  size: 20.0,
                  color: MyColors.buttonColor,
                ),
                Expanded(child: VilumeSlide(),)
                
              ],
            )
          ),
          Divider()
        ],
      )


    );
  }
}

class VilumeSlide extends StatefulWidget { 
  const VilumeSlide({
    Key key,
    this.title,

  }) : super(key: key);

  final String title;

    @override
   _VilumeSlideState createState() => _VilumeSlideState();
}
class _VilumeSlideState extends State<VilumeSlide> {
  double _currentSliderValue = 20;

  void _handleValueChange(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: new Transform(
      alignment: Alignment.topLeft,
      transform: new Matrix4(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1),
      child: new SliderTheme(
         data: SliderThemeData(
            trackHeight: 1.5,
            trackShape: RectangularSliderTrackShape() ,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6,),
            // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6,),
            // overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0)
          ),
          child: Slider(
            value: _currentSliderValue,
            min: 0,
            max: 100,
            // divisions: 10,
            label: _currentSliderValue.round().toString(),
            onChanged: _handleValueChange,
            activeColor: MyColors.buttonColor,
            // activeColor: MyColors.accentColor,
            inactiveColor: Color(0xFFB3B6B4),
            
          // inactiveColor: MyColors.buttonColor,
          ), 
        )
    )
    
   );

  }
}
class StatusDescription extends StatefulWidget { 
  const StatusDescription({
    Key key,
    this.title,

  }) : super(key: key);

  final String title;

    @override
   _StatusDescriptionState createState() => _StatusDescriptionState();
}
class _StatusDescriptionState extends State<StatusDescription> {
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
              color: MyColors.buttonColor,
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

        ],
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
