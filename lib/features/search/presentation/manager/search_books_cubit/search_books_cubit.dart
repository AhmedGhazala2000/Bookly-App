import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  SearchRepo searchRepo;

  Future<void> getSearchedBooks({required String booksName}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchedBooks(booksName: booksName);
    result.fold(
      (lFailures) => emit(SearchBooksFailure(errMessage: lFailures.errMessage)),
      (rBooks) => emit(SearchBooksSuccess(books: rBooks)),
    );
  }
}
