import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

customErrorMessage(BuildContext context, {required String text}) {
  return Center(
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        style: Styles.styleSemiBold18(context).copyWith(fontSize: 16),
      ),
    ),
  );
}
