import 'package:flutter/material.dart';
import 'package:flutter_sandbox/samples/stack/stack_item.dart';

/// そもそもStackとは？
/// -> ウィジェットを重ねることができるウィジェット (https://flutter.ctrnost.com/basic/layout/stack/)
///    Stackを使ったサンプルページ
/// 　　指定した時間を経過するとStackの子要素として設定しているウィジェットを非表示にしてみる
class StackSample extends StatelessWidget {
  const StackSample({super.key});

  /// Stackとして重ねる画像
  final items = const <StackItem>[
    // StackItem(
    //   imagePath: 'assets/images/15.png',
    //   visibleMilliseconds: 15000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/14.png',
    //   visibleMilliseconds: 14000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/13.png',
    //   visibleMilliseconds: 13000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/12.png',
    //   visibleMilliseconds: 12000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/11.png',
    //   visibleMilliseconds: 11000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/10.png',
    //   visibleMilliseconds: 10000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/9.png',
    //   visibleMilliseconds: 9000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/8.png',
    //   visibleMilliseconds: 8000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/7.png',
    //   visibleMilliseconds: 7000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/6.png',
    //   visibleMilliseconds: 6000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/5.png',
    //   visibleMilliseconds: 5000,
    // ),
    // StackItem(
    //   imagePath: 'assets/images/4.png',
    //   visibleMilliseconds: 4000,
    // ),
    StackItem(
      imagePath: 'assets/images/3.png',
      visibleMilliseconds: 3000,
    ),
    StackItem(
      imagePath: 'assets/images/2.png',
      visibleMilliseconds: 2000,
    ),
    StackItem(
      imagePath: 'assets/images/1.png',
      visibleMilliseconds: 1000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('stack_sample'),
        ),
        body: Stack(
          children: items,
        ));
  }
}
