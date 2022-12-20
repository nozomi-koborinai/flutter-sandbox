import 'package:flutter/material.dart';
import '../receiver/shape.dart';

class ShapeContainer extends StatelessWidget {
  final Shape shape;

  const ShapeContainer({
    super.key,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.0,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: shape.height,
          width: shape.width,
          decoration: BoxDecoration(
            color: shape.color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
