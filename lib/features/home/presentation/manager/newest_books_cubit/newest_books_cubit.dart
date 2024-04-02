import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class FreeBooksCubit extends Cubit<FreeBooksState> {
  FreeBooksCubit(this.homeRepo) : super(FreeBooksInitial());
  HomeRepo homeRepo;

  Future<void> getNewestBooks() async {
    emit(FreeBooksLoading());
    var result = await homeRepo.fetchFreeBooks();
    result.fold(
      (lFailures) => emit(FreeBooksFailure(errMessage: lFailures.errMessage)),
      (rBooks) => emit(FreeBooksSuccess(books: rBooks)),
    );
  }
}
