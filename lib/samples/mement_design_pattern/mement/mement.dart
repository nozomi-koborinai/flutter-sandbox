import '../../command_design_pattern/receiver/shape.dart';
import 'imement.dart';

class Memento extends IMemento {
  late final Shape _state;

  Memento(Shape shape) {
    _state = Shape.copy(shape);
  }

  @override
  Shape getState() {
    return _state;
  }
}
