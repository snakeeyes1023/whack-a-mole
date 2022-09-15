import 'package:flutter/material.dart';

import '../helper/colorHelper.dart';

abstract class CustomButton extends StatelessWidget {
  final String text;
  final bool isActive;

  const CustomButton({super.key, required this.text, isActive = true})
      : this.isActive = isActive;

  onButtonClicked();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onButtonClicked();
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(
            width: 2.0, color: isActive ? ColorHelper.blue : Colors.white),
        minimumSize: Size(300, 60),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      //change the color of outline
    );
  }
}
