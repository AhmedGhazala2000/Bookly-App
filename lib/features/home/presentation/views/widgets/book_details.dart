import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:bookly_app/core/functions/get_price.dart';
import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.book});

  final BookEntity book;

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
              imageUrl: book.image,
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
                  book.title,
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
                    book.authorName,
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
                      rating: book.averageRating,
                      count: book.ratingsCount,
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
