import '../receiver/shape.dart';
import 'command.dart';
import 'dart:math' as math;

class ChangeWidthCommand implements Command {
  Shape shape;
  late double previousWidth;
  final random = math.Random();

  ChangeWidthCommand(this.shape) {
    previousWidth = shape.width;
  }

  @override
  void execute() {
    shape.width = (random.nextInt(100) + 50).toDouble();
  }

  @override
  String getTitle() {
    return 'Change width';
  }

  @override
  void undo() {
    shape.width = previousWidth;
  }
}
