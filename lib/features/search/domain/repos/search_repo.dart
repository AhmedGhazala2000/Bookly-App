import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookEntity>>> fetchSearchedBooks(
      {required String booksName});
}
