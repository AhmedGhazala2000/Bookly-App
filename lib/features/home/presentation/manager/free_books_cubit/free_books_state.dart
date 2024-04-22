import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

sealed class FreeBooksState extends Equatable {
  const FreeBooksState();

  @override
  List<Object> get props => [];
}

final class FreeBooksInitial extends FreeBooksState {}

final class FreeBooksLoading extends FreeBooksState {}

final class FreeBooksSuccess extends FreeBooksState {
  final List<BookEntity> books;
  const FreeBooksSuccess({required this.books});
}

final class FreeBooksFailure extends FreeBooksState {
  final String errMessage;

  const FreeBooksFailure({required this.errMessage});
}
