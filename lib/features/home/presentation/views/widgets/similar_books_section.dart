import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(child: SizedBox(height: 49)),
          Text(
            'You can also like',
            style: Styles.styleSemiBold18(context).copyWith(
              fontSize: getResponsiveFontSize(context, fontSize: 14),
            ),
          ),
          const SizedBox(height: 16),
          const SimilarBooksListView(),
        ],
      ),
    );
  }
}
