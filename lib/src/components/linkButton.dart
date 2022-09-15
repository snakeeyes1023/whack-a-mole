import 'package:flutter/material.dart';

import 'customButton.dart';

class LinkButton extends CustomButton {
  const LinkButton({super.key, text}) : super(text: text);

  @override
  onButtonClicked() {
    print("Link button clicked");
  }
}
