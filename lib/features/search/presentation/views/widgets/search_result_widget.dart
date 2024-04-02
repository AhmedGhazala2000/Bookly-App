import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_results_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return SearchResultsListView(books: state.books);
        } else if (state is SearchBooksFailure) {
          return Column(
            children: [
              const SizedBox(height: 200),
              customErrorMessage(context, text: state.errMessage),
            ],
          );
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
          return Center(
            child: Lottie.asset(AssetsImg.searchIcon),
          );
        }
      },
    );
  }
}
