/// コマンドを抽象的に定義
abstract class Command {
  /// コマンドの実行
  void execute();

  /// コマンド名の取得
  String getTitle();

  /// コマンドの実行を元に戻す
  void undo();
}
