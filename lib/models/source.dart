import 'package:flutter/material.dart';
class SourceModle {
  String text;
  Widget icon;
  String image;
  SourceModle({
    this.text,
    this.icon,
    this.image
  });

  factory SourceModle.fromJson(Map<String, dynamic> json) {
    return SourceModle(
        text: json['text'],
        icon: json['icon'],
        image: json['image'],
    );
  }
}
class DrawerModle {
  String title;
  Widget icon;
  String urlName;
  String keyName;
  DrawerModle({
    this.title,
    this.icon,
    this.urlName,
    this.keyName,
  });

  factory DrawerModle.fromJson(Map<String, dynamic> json) {
    return DrawerModle(
        title: json['title'],
        icon: json['icon'],
        urlName: json['urlName'],
        keyName: json['keyName'],
    );
  }
}

