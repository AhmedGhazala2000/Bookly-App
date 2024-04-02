import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

customErrorMessage(BuildContext context, {required String text}) {
  return Center(
    child: Text(
      text,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Styles.styleSemiBold18(context).copyWith(fontSize: 16),
    ),
  );
}
