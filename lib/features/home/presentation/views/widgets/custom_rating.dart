import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
          size: 16,
        ),
        SizedBox(
          width: 6,
        ),
        Text('4.8'),
        SizedBox(
          width: 9,
        ),
        Text('(2390)'),
      ],
    );
  }
}
