import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BookDetails(
                  book: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return customErrorMessage(context, text: state.errMessage);
        } else if (state is SearchBooksInitial) {
          return Center(
            child: Text(
              'Start Searching Now',
              style: Styles.styleSemiBold18(context).copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        } else {
          return customCircularIndicator();
        }
      },
    );
  }
}
