import 'dart:async';

import 'package:flutter/material.dart';

class StackItem extends StatefulWidget {
  /// 引数
  ///
  /// imagePath：表示画像パス
  ///
  /// visibleMilliseconds：画像を表示したい時間（ミリ）
  const StackItem(
      {required this.imagePath, required this.visibleMilliseconds, super.key});
  final String imagePath;
  final int visibleMilliseconds;

  @override
  State<StackItem> createState() => _StackItemState();
}

class _StackItemState extends State<StackItem> {
  // 画像を表示/非表示制御するためのフラグ
  // 引数にて指定された時間が経過するとfalseになり非表示になる
  // = 一枚後ろの画像が現れることになる
  bool _visible = true;

  // 画像の透明度を保持する値
  double _opacity = 1.0;

  late Timer visibleTimer;
  late Timer opacityTimer;

  @override
  void initState() {
    super.initState();

    // 画像が非表示になるまでの時間を設定
    visibleTimer =
        Timer(Duration(milliseconds: widget.visibleMilliseconds), () {
      setState(() {
        _visible = false;
      });
    });

    // 画像が透明になり始めるまでの時間を設定
    // ここを調整するといい感じになる？
    opacityTimer = Timer(
        Duration(milliseconds: widget.visibleMilliseconds * 0.7.toInt()), () {
      setState(() {
        _opacity = 0.0;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    // timerを破棄
    visibleTimer.cancel();
    opacityTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1000), // 不透明 -> 透明にどれくらいの時間をかけるか
        opacity: _opacity,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(widget.imagePath),
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
