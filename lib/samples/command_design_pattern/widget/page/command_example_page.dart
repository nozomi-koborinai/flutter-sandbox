import 'package:flutter/material.dart';
import 'package:flutter_sandbox/samples/command_design_pattern/command/change_icon_command.dart';

import '../../command/change_color_command.dart';
import '../../command/change_height_command.dart';
import '../../command/change_width_command.dart';
import '../../command/command.dart';
import '../../command/command_history.dart';
import '../component/command_history_column.dart';
import '../component/shape.dart';

/// Commandサンプルアプリページ
class CommandExamplePage extends StatefulWidget {
  const CommandExamplePage({super.key});

  @override
  _CommandExamplePageState createState() => _CommandExamplePageState();
}

class _CommandExamplePageState extends State<CommandExamplePage> {
  // undoを実現するためのCommand履歴
  final CommandHistory _commandHistory = CommandHistory();
  // Receiver(shape)の初期設定
  final Shape _shape = Shape.initial();

  /// Invoker(色変更ボタン押下時に呼ばれるメソッド)
  void _changeColor() {
    // CommandのReceiverとして_shapeを渡す
    final command = ChangeColorCommand(_shape);
    // 実行したコマンドをコマンド履歴に追加
    _executeCommand(command);
  }

  /// Invoker(高さ変更ボタン押下時に呼ばれるメソッド)
  void _changeHeight() {
    // CommandのReceiverとして_shapeを渡す
    final command = ChangeHeightCommand(_shape);
    // 実行したコマンドをコマンド履歴に追加
    _executeCommand(command);
  }

  /// Invoker(幅変更ボタン押下時に呼ばれるメソッド)
  void _changeWidth() {
    // CommandのReceiverとして_shapeを渡す
    final command = ChangeWidthCommand(_shape);
    // 実行したコマンドをコマンド履歴に追加
    _executeCommand(command);
  }

  /// Invoker(アイコン変更ボタン押下時に呼ばれるメソッド)
  void _changeIcon() {
    // CommandのReceiverとして_shapeを渡す
    final command = ChangeIconCommand(_shape);
    // 実行したコマンドをコマンド履歴に追加
    _executeCommand(command);
  }

  void _executeCommand(Command command) {
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _undo() {
    if (_commandHistory.isEmpty) return;
    setState(() {
      _commandHistory.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Command Design Pattern',
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 160.0,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: _shape.height,
                  width: _shape.width,
                  decoration: BoxDecoration(
                    color: _shape.color,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Icon(
                    _shape.icon,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _changeColor,
              child: const Text('Change color command'),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: _changeHeight,
              child: const Text('Change height command'),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: _changeWidth,
              child: const Text('Change width command'),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: _changeIcon,
              child: const Text('Change icon command'),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: _undo,
              child: const Text('Undo'),
            ),
            const SizedBox(height: 15),
            CommandHistoryColumn(
              commandList: _commandHistory.commandHistoryList,
            ),
          ],
        ),
      ),
    );
  }
}
