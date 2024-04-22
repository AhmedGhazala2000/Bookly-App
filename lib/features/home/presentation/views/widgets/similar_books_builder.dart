import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksBuilder extends StatelessWidget {
  const SimilarBooksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SimilarBooksListView(books: state.books);
        } else if (state is SimilarBooksFailure) {
          return customErrorMessage(context, text: state.errMessage);
        } else {
          return customCircularIndicator();
        }
      },
    );
  }
}
