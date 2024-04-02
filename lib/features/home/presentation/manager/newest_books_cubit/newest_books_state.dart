part of 'newest_books_cubit.dart';

sealed class FreeBooksState extends Equatable {
  const FreeBooksState();

  @override
  List<Object> get props => [];
}

final class FreeBooksInitial extends FreeBooksState {}

final class FreeBooksLoading extends FreeBooksState {}

final class FreeBooksSuccess extends FreeBooksState {
  final List<BookItem> books;
  const FreeBooksSuccess({required this.books});
}

final class FreeBooksFailure extends FreeBooksState {
  final String errMessage;

  const FreeBooksFailure({required this.errMessage});
}
