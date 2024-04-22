import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.book}) : super(key: key);
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarBooksCubit(
        getIt.get<FetchSimilarBooksUseCase>(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: BookDetailsViewBody(book: book),
        ),
      ),
    );
  }
}
