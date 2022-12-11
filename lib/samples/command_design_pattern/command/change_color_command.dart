import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widget/component/shape.dart';
import 'command.dart';

/// 色変更コマンド
///
/// Commandインタフェースを実装して具体的な処理を記述する
class ChangeColorCommand implements Command {
  // 色変更対象のShapeオブジェクト
  Shape shape;
  // 変更前の色
  late Color previousColor;
  final random = math.Random();

  /// コンストラクタ
  ///
  /// 引数にてClientからReceiverを受け取る
  /// そのReceiverに対して変更を加えていくイメージ
  /// 今回の例で言うとReceiverはShapeオブジェクトとなる
  ChangeColorCommand(this.shape) {
    previousColor = shape.color;
  }

  /// コマンド処理の実体
  /// -> shapeにランダムな色を設定する
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

  /// 加えた変更を無かったことにする処理
  @override
  void undo() {
    shape.color = previousColor;
  }
}
