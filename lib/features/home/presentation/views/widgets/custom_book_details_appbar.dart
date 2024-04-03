import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:flutter/material.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            iconSize: getResponsiveFontSize(context, fontSize: 24),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
          Icon(
            Icons.shopping_cart,
            size: getResponsiveFontSize(
              context,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
