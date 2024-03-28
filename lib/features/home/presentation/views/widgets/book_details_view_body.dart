import 'package:bookly_app/features/home/data/models/book_model/item.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsViewBody extends StatefulWidget {
  const BookDetailsViewBody({Key? key, required this.book}) : super(key: key);
  final BookItem book;

  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context)
        .getSimilarBooks(category: widget.book.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              BookDetailsSection(book: widget.book),
              const Expanded(child: SizedBox(height: 49)),
              const SimilarBooksSection(),
            ],
          ),
        ),
      ],
    );
  }
}
