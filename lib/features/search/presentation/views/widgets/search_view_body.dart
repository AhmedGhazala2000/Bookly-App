import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomTextField(
            onSubmitted: (date) {
              BlocProvider.of<SearchBooksCubit>(context)
                  .getSearchedBooks(booksName: date);
            },
          ),
          const Expanded(child: SearchResultBuilder()),
        ],
      ),
    );
  }
}
