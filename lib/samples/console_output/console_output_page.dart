// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/components/visiblity_elevated_button.dart';
import 'package:flutter_sandbox/samples/console_output/models/book.dart';
import 'package:gap/gap.dart';

/// コンソール出力用のページ
///
/// ボタン押下時に内容をデバッグコンソールに出力する
class ConsoleOutputPage extends StatelessWidget {
  const ConsoleOutputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('コンソール出力用ページ')),
      body: Center(
        child: Column(
          children: [
            VisibilityElevatedButton(
              title: '出力のテスト',
              onPressed: ConsoleOutputFunctions.instance.outputTestString,
            ),
            const Gap(7),
            VisibilityElevatedButton(
              title: 'ミュータブル',
              onPressed: ConsoleOutputFunctions.instance.mutable,
            ),
            const Gap(7),
            VisibilityElevatedButton(
              title: 'イミュータブル',
              onPressed: ConsoleOutputFunctions.instance.immutable,
            )
          ],
        ),
      ),
    );
  }
}

/// コンソール出力メソッドをまとめたクラス
class ConsoleOutputFunctions {
  /// singleton
  static final instance = ConsoleOutputFunctions._();
  ConsoleOutputFunctions._();

  /// 文字列'test'を標準出力する
  void outputTestString() => print('test');

  /// ミュータブルの確認結果を標準出力する
  void mutable() {
    final mutableBook = Book(id: '1', name: '本の1だよ');
    print('id:${mutableBook.id}, name:${mutableBook.name}');
    final mutableBookCopy = mutableBook;
    mutableBookCopy.id = '1copy';
    mutableBookCopy.name = '本の1だよcopy';
    print('id:${mutableBookCopy.id}, name:${mutableBookCopy.name}');
    print('id:${mutableBook.id}, name:${mutableBook.name}');
  }

  /// イミュータブルの確認結果を標準出力する
  void immutable() {
    final immutableBook = Book(id: '2', name: '本の2だよ');
    print('id:${immutableBook.id}, name:${immutableBook.name}');
    final immutableBookCopy = immutableBook.copyWith(name: '本の2をディープコピーしたよ');
    print('id:${immutableBookCopy.id}, name:${immutableBookCopy.name}');
    immutableBookCopy.id = '2を変更';
    print('id:${immutableBook.id}, name:${immutableBook.name}');
    print('id:${immutableBookCopy.id}, name:${immutableBookCopy.name}');
  }
}
