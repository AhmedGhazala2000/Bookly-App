import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.onSubmitted}) : super(key: key);
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: TextField(
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          filled: true,
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 15),
          ),
          suffixIcon: const Icon(Icons.search),
          suffixStyle: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 15),
          ),
          enabledBorder: buildOutlineInputBorder(color: Colors.transparent),
          focusedBorder: buildOutlineInputBorder(color: Colors.white),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}
