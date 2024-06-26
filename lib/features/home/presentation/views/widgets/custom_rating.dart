import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({Key? key, required this.rating, required this.count})
      : super(key: key);
  final num? rating, count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: const Color(0xffFFDD4F),
          size: getResponsiveFontSize(context, fontSize: 16),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          '$rating',
          style: Styles.styleMedium14(context).copyWith(
            fontSize: getResponsiveFontSize(context, fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 9,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            style: Styles.styleMedium14(context)
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
