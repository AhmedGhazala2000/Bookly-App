import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({Key? key, this.rating, this.count}) : super(key: key);
  final num? rating, count;

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
          '$rating',
          style: Styles.styleMedium14.copyWith(fontSize: 16),
        ),
        const SizedBox(
          width: 9,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
          ),
        ),
      ],
    );
  }
}
