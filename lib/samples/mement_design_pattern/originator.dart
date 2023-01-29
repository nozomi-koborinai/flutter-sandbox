import '../command_design_pattern/receiver/shape.dart';
import 'mement/imement.dart';
import 'mement/mement.dart';

class Originator {
  late Shape state;

  Originator() {
    state = Shape.initial();
  }

  IMemento createMemento() {
    return Memento(state);
  }

  void restore(IMemento memento) {
    state = memento.getState();
  }
}
