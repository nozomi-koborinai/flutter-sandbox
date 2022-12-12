import '../component/shape.dart';
import 'command.dart';
import 'dart:math' as math;

class ChangeHeightCommand implements Command {
  Shape shape;
  late double previousHeight;
  final random = math.Random();

  ChangeHeightCommand(this.shape) {
    previousHeight = shape.height;
  }

  @override
  void execute() {
    shape.height = (random.nextInt(100) + 50).toDouble();
  }

  @override
  String getTitle() {
    return 'Change height';
  }

  @override
  void undo() {
    shape.height = previousHeight;
  }
}
