import 'package:flutter/material.dart';

/// Commandの受取手、Command処理の対象オブジェクト
class Shape {
  late Color color;
  late double height;
  late double width;
  late IconData icon;

  Shape.initial() {
    color = Colors.black;
    height = 150.0;
    width = 150.0;
    icon = Icons.star;
  }
}
