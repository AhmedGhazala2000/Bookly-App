import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bloc.BlocBuilder<FreeBooksCubit, FreeBooksState>(
      builder: (context, state) {
        if (state is FreeBooksSuccess) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 50, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => BookDetailsView(book: state.books[index]),
                      transition: Transition.fadeIn,
                      duration: kTransitionDuration,
                    );
                  },
                  child: BookDetails(
                    book: state.books[index],
                  ),
                ),
              );
            },
          );
        } else if (state is FreeBooksFailure) {
          return SliverToBoxAdapter(
            child: customErrorMessage(context, text: state.errMessage),
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
