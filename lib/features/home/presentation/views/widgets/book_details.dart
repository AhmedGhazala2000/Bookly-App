import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const BookDetailsView(),
          transition: Transition.fadeIn,
          duration: kTransitionDuration,
        );
      },
      child: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 70,
            ),
            child: const BookImage(),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Harry Potter and the Goblet of Fire',
                  maxLines: 2,
                  style: Styles.styleRegular20
                      .copyWith(fontFamily: 'GT Sectra Fine'),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Opacity(
                  opacity: .7,
                  child: Text(
                    'J.K. Rowling',
                    style: Styles.styleMedium14,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '19.99 €',
                      style: Styles.styleRegular20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const CustomRating(),
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