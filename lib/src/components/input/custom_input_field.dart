import 'package:flutter/material.dart';

import '../../helper/color_helper.dart';

class CustomInputField extends StatefulWidget {
  CustomInputField(
      {super.key,
      required this.text,
      required this.fieldController,
      this.paddingHorizontal = 30,
      this.paddingVertical = 8,
      this.labelText = ''});

  final String text;
  final String labelText;
  final double paddingHorizontal;
  final double paddingVertical;
  final TextEditingController fieldController;

  @override
  State<CustomInputField> createState() => _CustomInputField();
}

class _CustomInputField extends State<CustomInputField> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.paddingHorizontal,
            vertical: widget.paddingVertical),
        child: Row(children: [
          Expanded(
              child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          )),
          Expanded(
            child: TextFormField(
              controller: widget.fieldController,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                fillColor: ColorHelper.blue,
                labelText: widget.labelText,
              ),
            ),
          )
        ]));
  }
}
