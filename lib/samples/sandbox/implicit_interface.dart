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
