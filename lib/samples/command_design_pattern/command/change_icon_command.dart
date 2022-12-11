import 'package:flutter/material.dart';

import '../widget/component/shape.dart';
import 'command.dart';

/// アイコン変更コマンド
class ChangeIconCommand implements Command {
  // アイコン変更対象のShapeオブジェクト
  Shape shape;
  // 変更前のアイコン
  late IconData previousIcon;

  ChangeIconCommand(this.shape) {
    previousIcon = shape.icon;
  }

  @override
  void execute() {
    shape.icon = Icons.star_border;
  }

  @override
  String getTitle() {
    return 'Change icon';
  }

  @override
  void undo() {
    shape.icon = previousIcon;
  }
}
