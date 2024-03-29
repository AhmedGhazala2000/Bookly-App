import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';

class BookFeaturedListView extends StatelessWidget {
  const BookFeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return bloc.BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: 190,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 30),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        () => BookDetailsView(book: state.books[index]),
                        transition: Transition.fadeIn,
                        duration: kTransitionDuration,
                      );
                    },
                    child: BookImage(
                      book: state.books[index],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return customErrorMessage(text: state.errMessage);
        } else {
          return customCircularIndicator();
        }
      },
    );
  }
}
