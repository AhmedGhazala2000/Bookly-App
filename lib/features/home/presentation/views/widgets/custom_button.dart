import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.borderRadius,
    this.backColor,
    this.textColor,
    this.onPressed,
    this.width,
  }) : super(key: key);
  final String text;
  final Color? backColor;
  final Color? textColor;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      color: backColor ?? Colors.white,
      onPressed: onPressed,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: Styles.styleBold16(context).copyWith(color: textColor),
        ),
      ),
    );
  }
}
