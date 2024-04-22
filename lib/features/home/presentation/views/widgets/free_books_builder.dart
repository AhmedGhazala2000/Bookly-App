import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/features/home/presentation/manager/free_books_cubit/free_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/free_books_cubit/free_books_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/free_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FreeBooksBuilder extends StatelessWidget {
  const FreeBooksBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreeBooksCubit, FreeBooksState>(
      builder: (context, state) {
        if (state is FreeBooksSuccess) {
          return FreeBooksListView(
            books: state.books,
          );
        } else if (state is FreeBooksFailure) {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 200),
                customErrorMessage(context, text: state.errMessage),
              ],
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 200),
                customCircularIndicator(),
              ],
            ),
          );
        }
      },
    );
  }
}
