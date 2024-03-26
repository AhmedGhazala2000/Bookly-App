part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksSucsess extends NewestBooksState {
  final List<BookItem> books;
  const NewestBooksSucsess({required this.books});
}

final class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

  const NewestBooksFailure({required this.errMessage});
}
