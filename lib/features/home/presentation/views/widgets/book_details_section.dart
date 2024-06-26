import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/buttons_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: getResponsiveFontSize(
                context,
                fontSize: height > 1000 ? 200 : 165,
              ),
            ),
            child: BookImage(
              imageUrl: book.image,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Styles.styleRegular20(context)
                .copyWith(fontSize: 30, fontFamily: 'GT Sectra Fine'),
          ),
          const SizedBox(height: 4),
          Opacity(
            opacity: .7,
            child: Text(
              book.authorName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Styles.styleMedium14(context).copyWith(fontSize: 18),
            ),
          ),
          const SizedBox(height: 14),
          CustomRating(
            rating: book.averageRating,
            count: book.ratingsCount,
          ),
          const SizedBox(height: 37),
          ButtonsAction(
            book: book,
          )
        ],
      ),
    );
  }
}
