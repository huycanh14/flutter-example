import 'package:app_time_tracker/common_widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';

class SocialSignButton extends CustomRaisedButton {
  SocialSignButton(
      {@required String assetName,
      @required String text,
      @required Color color,
      @required Color textColor,
      @required VoidCallback onPress})
      : assert(assetName != null),
        assert(text != null),
        super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(assetName),
                Text(
                  text,
                  style: TextStyle(color: textColor, fontSize: 15.0),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Image.asset(assetName),
                )
              ],
            ),
            color: color,
            height: 40.0,
            onPress: onPress);
}
