import 'package:flutter/material.dart';

import 'customButton.dart';

class LinkButton extends CustomButton {
  VoidCallback? onClick;

  LinkButton({super.key, text, this.onClick, isActive = false})
      : super(text: text, isActive: isActive);

  @override
  onButtonClicked() {
    if (onClick != null) {
      onClick!.call();
    } else {
      print("Link button clicked");
    }
  }
}
