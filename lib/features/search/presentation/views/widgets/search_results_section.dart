import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_results_list_view.dart';
import 'package:flutter/material.dart';

class SearchResultsSection extends StatelessWidget {
  const SearchResultsSection({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Result',
          style: Styles.styleSemiBold18(context),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: SearchResultsListView(books: books),
        ),
      ],
    );
  }
}
