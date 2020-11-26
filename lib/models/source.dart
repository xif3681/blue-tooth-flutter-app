import 'package:flutter/material.dart';
class SourceModle {
  String text;
  IconData icon;
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
