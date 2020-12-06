
class SpeakerModle {
  String id;
  String name;
  String title;
  // String image;

  SpeakerModle({
    this.id,
    this.name,
    this.title,
    // this.image,

  });

  factory SpeakerModle.fromJson(Map<String, dynamic> json) {
    return SpeakerModle(
        id: json['id'],
        name: json['name'],
        title: json['title'],
        // image: json['image'],
 
    );
  }
}
