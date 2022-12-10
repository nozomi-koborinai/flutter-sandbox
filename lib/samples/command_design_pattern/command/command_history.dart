import 'command.dart';

class CommandHistory {
  final List<Command> _commandList = <Command>[];

  bool get isEmpty => _commandList.isEmpty;
  List<String> get commandHistoryList =>
      _commandList.map((c) => c.getTitle()).toList();

  void add(Command command) {
    _commandList.add(command);
  }

  void undo() {
    if (_commandList.isNotEmpty) {
      final command = _commandList.removeLast();
      command.undo();
    }
  }
}
