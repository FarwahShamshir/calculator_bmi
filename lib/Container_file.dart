import 'package:flutter/material.dart';


class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({
    required this.color,
    required this.cardWidget,
    required this.onPressed,
  });

  final Color color;
  final Widget cardWidget;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardWidget,
      ),
    );
  }
}
