import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
          size: 16,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          '4.8',
          style: Styles.styleMedium14.copyWith(fontSize: 16),
        ),
        const SizedBox(
          width: 9,
        ),
        const Opacity(
          opacity: .5,
          child: Text(
            '(2390)',
          ),
        ),
      ],
    );
  }
}
