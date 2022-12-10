import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widget/component/shape.dart';
import 'command.dart';

class ChangeColorCommand implements Command {
  Shape shape;
  late Color previousColor;
  final random = math.Random();

  ChangeColorCommand(this.shape) {
    previousColor = shape.color;
  }

  @override
  void execute() {
    shape.color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1.0,
    );
  }

  @override
  String getTitle() {
    return 'Change color';
  }

  @override
  void undo() {
    shape.color = previousColor;
  }
}
