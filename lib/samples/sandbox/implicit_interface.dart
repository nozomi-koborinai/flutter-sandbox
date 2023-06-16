class SampleRepository {
  SampleRepository();

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
class MockSampleRepository implements SampleRepository {
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

/// dart におけるインターフェース
interface class Interface {
  final test1 = 1;
  var test2 = 2;

  // void method1();                            // これだとメソッド本体がないためにコンパイルエラー
  void method3() => test2 += 1; // 具象メソッドならコンパイルエラーにはならない
  void method2() => throw UnimplementedError(); // 抽象メソッドっぽい具象メソッドを定義
}
