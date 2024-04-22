import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimilarBooksInitial());
  FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> getSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await fetchSimilarBooksUseCase.call(category);
    result.fold(
      (failures) => emit(SimilarBooksFailure(errMessage: failures.errMessage)),
      (books) => emit(SimilarBooksSuccess(books: books)),
    );
  }
}
