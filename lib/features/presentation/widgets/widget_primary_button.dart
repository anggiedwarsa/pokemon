import 'package:flutter/material.dart';

class WidgetPrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Color? textColor;
  final FocusNode? focusNode;
  final Color? backgroundColor;
  final double height;
  final BorderSide borderSide;
  final double borderRadius;

  WidgetPrimaryButton({
    required this.onPressed,
    required this.child,
    this.textColor,
    this.focusNode,
    this.backgroundColor,
    this.height = 44.0,
    this.borderSide = BorderSide.none,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return height == 0
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: backgroundColor,
              foregroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
                side: borderSide,
              ),
            ),
            focusNode: focusNode,
            child: child,
          )
        : SizedBox(
            height: height,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: backgroundColor,
                foregroundColor: textColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                  side: borderSide,
                ),
              ),
              focusNode: focusNode,
              child: child,
            ),
          );
  }
}
