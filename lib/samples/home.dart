import 'package:flutter/material.dart';
import 'package:flutter_sandbox/samples/stack/stack_sample.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sand Box'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('stack_sample'),
              onPressed: () => _onPressed(context),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _onPressed(BuildContext context) async {
  // （1） 指定した画面に遷移する
  Navigator.push(
    context,
    MaterialPageRoute(
      // （2） 実際に表示するページ(ウィジェット)を指定する
      builder: (context) => const StackSample(),
    ),
  );
}
