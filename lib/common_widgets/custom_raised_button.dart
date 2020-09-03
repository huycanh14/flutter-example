import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  @required
  final Widget child;
  @required
  final Color color;
  @required
  final double borderRadius;
  @required
  final double height;
  @required
  final VoidCallback onPress;

  CustomRaisedButton(
      {this.child,
      this.color,
      this.borderRadius: 2.0,
      this.height: 50.0,
      this.onPress})
      : assert(borderRadius != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
