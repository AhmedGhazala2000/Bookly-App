import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookFeaturedListView extends StatelessWidget {
  const BookFeaturedListView({super.key, required this.books});

  final List<BookItem> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getResponsiveFontSize(context, fontSize: 200),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => BookDetailsView(book: books[index]),
                  transition: Transition.fadeIn,
                  duration: kTransitionDuration,
                );
              },
              child: BookImage(
                book: books[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
