import 'package:flutter/material.dart';

import 'constantFile.dart';


Widget repeatTextAndIcon({required IconData iconData, required String label}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        iconData,
        size: 80.0,
      ),
      const SizedBox(
        height: 15.0,
      ),
      Text(
        label,
        style: kLabelStyle,
      ),
    ],
  );
}
class RoundIcon extends StatelessWidget {
  RoundIcon({required this.iconData, required this.onPress});

  final IconData iconData;
  final VoidCallback onPress; // Changed Function to VoidCallback for type safety

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress, // Correct: the function is called directly
      child: Icon(iconData),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}
