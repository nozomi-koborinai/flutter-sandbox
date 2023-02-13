// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/components/visiblity_elevated_button.dart';

/// コンソール出力用のページ
///
/// ボタン押下時に内容をデバッグコンソールに出力する
class ConsoleOutputPage extends StatelessWidget {
  const ConsoleOutputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('コンソール出力用ページ')),
      body: Column(
        children: [
          VisibilityElevatedButton(
              title: '出力のテスト', onPressed: () => {print('test')}),
        ],
      ),
    );
  }
}

/// コンソール出力メソッドをまとめたクラス
class ConsoleOutputFunctions {
  /// singleton
  static final instance = ConsoleOutputFunctions._();
  ConsoleOutputFunctions._();
}
