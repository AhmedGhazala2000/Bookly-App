import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoadig());
    var result = await featuredBooksUseCase.call();
    result.fold(
      (failures) => emit(FeaturedBooksFailure(errMessage: failures.errMessage)),
      (books) => emit(FeaturedBooksSuccess(books: books)),
    );
  }
}
