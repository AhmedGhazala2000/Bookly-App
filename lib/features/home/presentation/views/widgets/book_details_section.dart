import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/buttons_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);
  final BookItem book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 162,
            ),
            child: BookImage(
              book: book,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            book.volumeInfo?.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Styles.styleRegular20
                .copyWith(fontSize: 30, fontFamily: 'GT Sectra Fine'),
          ),
          const SizedBox(height: 4),
          Opacity(
            opacity: .7,
            child: Text(
              book.volumeInfo?.authors?[0] ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Styles.styleMedium14.copyWith(fontSize: 18),
            ),
          ),
          const SizedBox(height: 14),
          CustomRating(
            rating: book.volumeInfo?.averageRating ?? 0,
            count: book.volumeInfo?.ratingsCount ?? 0,
          ),
          const SizedBox(height: 37),
          ButtonsAction(
            previewLink: book.volumeInfo?.previewLink,
          )
        ],
      ),
    );
  }
}
