import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreeBooksListView extends StatelessWidget {
  const FreeBooksListView({super.key, required this.books});

  final List<BookItem> books;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 30, right: 50, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Get.to(
                () => BookDetailsView(book: books[index]),
                transition: Transition.fadeIn,
                duration: kTransitionDuration,
              );
            },
            child: BookDetails(
              book: books[index],
            ),
          ),
        );
      },
    );
  }
}
