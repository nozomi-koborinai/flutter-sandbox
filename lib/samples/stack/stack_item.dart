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

  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer(Duration(milliseconds: widget.visibleMilliseconds), () {
      setState(() {
        _visible = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(widget.imagePath),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
