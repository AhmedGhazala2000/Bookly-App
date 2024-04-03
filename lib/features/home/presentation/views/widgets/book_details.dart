import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/functions/get_price.dart';
import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.book});

  final BookItem book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => BookDetailsView(book: book),
          transition: Transition.fadeIn,
          duration: kTransitionDuration,
        );
      },
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: getResponsiveFontSize(context, fontSize: 70),
            ),
            child: BookImage(
              book: book,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.volumeInfo?.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.styleRegular20(context)
                      .copyWith(fontFamily: 'GT Sectra Fine'),
                ),
                const SizedBox(
                  height: 2,
                ),
                Opacity(
                  opacity: .7,
                  child: Text(
                    book.volumeInfo?.authors?[0] ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.styleMedium14(context),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      getPrice(book),
                      style: Styles.styleMedium14(context).copyWith(
                        fontSize: getResponsiveFontSize(context, fontSize: 17),
                      ),
                    ),
                    const Spacer(),
                    CustomRating(
                      rating: book.volumeInfo?.averageRating ?? 0,
                      count: book.volumeInfo?.ratingsCount ?? 0,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
