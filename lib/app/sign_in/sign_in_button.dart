import 'package:app_time_tracker/common_widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton(
      {@required String text,
      Color color,
      Color textColor,
      VoidCallback onPress})
      : assert(text != null),
        super(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15.0),
            ),
            color: color,
            height: 40.0,
            onPress: onPress);
}
