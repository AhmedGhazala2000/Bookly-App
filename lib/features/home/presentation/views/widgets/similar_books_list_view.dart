import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.books});

  final List<BookItem> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getResponsiveFontSize(context, fontSize: 112),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BookDetailsView(
                        book: books[index],
                      );
                    },
                  ),
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
