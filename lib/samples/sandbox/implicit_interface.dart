///////////////////////////////////////////////////////
/// 暗黙的インターフェースの検証
///////////////////////////////////////////////////////

/// クラス本体を作ると暗黙的インターフェースが作られる
class Repository {
  Repository();

  void add(Object obj) {
    return;
  }

  void delete() {
    return;
  }

  void update(Object obj) {
    return;
  }

  Object fetchObj() {
    return Object();
  }
}

/// SampleRepositoryに暗黙的に定義されたインタフェースを実装
class RepositoryImpl1 implements Repository {
  @override
  void add(Object obj) {
    throw UnimplementedError();
  }

  @override
  void delete() {
    throw UnimplementedError();
  }

  @override
  void update(Object obj) {
    throw UnimplementedError();
  }

  @override
  Object fetchObj() {
    throw UnimplementedError();
  }
}

/// 暗黙的インターフェースの実体は abstract interface なので、extends も可能
/// extends の場合、継承元メソッドに対する実装の強制力はない
/// 継承元に実装を強制したいメソッドがあったとしてもコンパイルエラーにはならないので実装漏れを起こす可能性がある
class MockRepository2 extends Repository {}

/// dart におけるインターフェース
interface class Interface {
  final test1 = 1;
  var test2 = 2;

  // void method1();                            // これだとメソッド本体がないためにコンパイルエラー
  void method3() => test2 += 1; // 具象メソッドならコンパイルエラーにはならない
  void method2() => throw UnimplementedError(); // 抽象メソッドっぽい具象メソッドを定義
}
