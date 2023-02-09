import 'package:flutter/material.dart';

class VisibilityElevatedButton extends StatelessWidget {
  const VisibilityElevatedButton(
      {required this.title, this.onPressed, this.visible = true, super.key});
  final String title;
  final Function? onPressed;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: ElevatedButton(
        child: Text(title),
        onPressed: () => onPressed?.call(),
      ),
    );
  }
}
