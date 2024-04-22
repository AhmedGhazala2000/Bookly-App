import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details.dart';
import 'package:flutter/material.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BookDetails(
            book: books[index],
          ),
        );
      },
    );
  }
}
