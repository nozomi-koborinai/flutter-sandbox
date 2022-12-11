import 'package:flutter/material.dart';

import '../../command/change_color_command.dart';
import '../../command/change_height_command.dart';
import '../../command/change_width_command.dart';
import '../../command/command.dart';
import '../../command/command_history.dart';
import '../component/command_history_column.dart';
import '../component/shape.dart';

class CommandExamplePage extends StatefulWidget {
  const CommandExamplePage({super.key});

  @override
  _CommandExamplePageState createState() => _CommandExamplePageState();
}

class _CommandExamplePageState extends State<CommandExamplePage> {
  final CommandHistory _commandHistory = CommandHistory();
  final Shape _shape = Shape.initial();

  void _changeColor() {
    final command = ChangeColorCommand(_shape);
    _executeCommand(command);
  }

  void _changeHeight() {
    final command = ChangeHeightCommand(_shape);
    _executeCommand(command);
  }

  void _changeWidth() {
    final command = ChangeWidthCommand(_shape);
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
                  child: const Icon(
                    Icons.star,
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
