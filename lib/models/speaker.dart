
class SpeakerModle {
  String id;
  String name; // 名称
  double volumeValue; // 音量
  int connectStatus; // 连接状态


  SpeakerModle({
    this.id,
    this.name,
    this.volumeValue,
    this.connectStatus,


  });

  factory SpeakerModle.fromJson(Map<String, dynamic> json) {
    return SpeakerModle(
        id: json['id'],
        name: json['name'],
        volumeValue: json['volumeValue'],
        connectStatus: json['connectStatus'],

 
    );
  }
}
