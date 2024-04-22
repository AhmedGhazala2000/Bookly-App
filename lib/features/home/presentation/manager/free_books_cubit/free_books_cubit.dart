import 'package:bookly_app/features/home/domain/use_cases/fetch_free_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manager/free_books_cubit/free_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FreeBooksCubit extends Cubit<FreeBooksState> {
  FreeBooksCubit(this.fetchFreeBooksUseCase) : super(FreeBooksInitial());
  FetchFreeBooksUseCase fetchFreeBooksUseCase;

  Future<void> getFreeBooks() async {
    emit(FreeBooksLoading());
    var result = await fetchFreeBooksUseCase.call();
    result.fold(
      (failures) => emit(FreeBooksFailure(errMessage: failures.errMessage)),
      (books) => emit(FreeBooksSuccess(books: books)),
    );
  }
}
