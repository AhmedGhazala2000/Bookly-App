import 'package:bookly_app/core/models/book_model/item.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  HomeRepo homeRepo;

  Future<void> getBooks() async {
    emit(FeaturedBooksLoadig());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (lFailures) =>
          emit(FeaturedBooksFailure(errMessage: lFailures.errMessage)),
      (rBooks) => emit(FeaturedBooksSuccess(books: rBooks)),
    );
  }
}
