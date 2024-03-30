import 'package:bookly_app/core/utils/responsive_font_size.dart';
import 'package:bookly_app/core/widgets/custom_circular_indicator.dart';
import 'package:bookly_app/core/widgets/custom_error_message.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: getResponsiveFontSize(context, fontSize: 112),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
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
                              book: state.books[index],
                            );
                          },
                        ),
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
        } else if (state is SimilarBooksFailure) {
          return customErrorMessage(context, text: state.errMessage);
        } else {
          return customCircularIndicator();
        }
      },
    );
  }
}
