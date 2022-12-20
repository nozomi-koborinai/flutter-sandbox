import '../command.dart';

/// 実行したCommandを履歴管理するためのオブジェクト
class CommandHistory {
  final List<Command> _commandList = <Command>[];

  bool get isEmpty => _commandList.isEmpty;

  /// 実行したコマンド名を文字列のリストで返却
  List<String> get commandHistoryList =>
      _commandList.map((c) => c.getTitle()).toList();

  void add(Command command) {
    _commandList.add(command);
  }

  /// Command履歴リストの末尾要素を削除
  /// Command履歴リストの末尾要素のundo処理を実行して一つ前の状態に戻す
  void undo() {
    if (_commandList.isNotEmpty) {
      final command = _commandList.removeLast();
      command.undo();
    }
  }
}
